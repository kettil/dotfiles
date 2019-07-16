const puppeteer = require('puppeteer');
const yargs = require('yargs');
const luxon = require('luxon');

process.chdir('/data');

const argsPuppeteer = {
  w: {
    alias: 'width',
    describe: 'Page width in pixels',
    default: 1920,
    type: 'number'
  },
  h: {
    alias: 'height',
    describe: 'Page height in pixels',
    default: 1080,
    type: 'number'
  },
  s: {
    alias: 'deviceScaleFactor',
    describe: 'Specify device scale factor',
    default: 1,
    type: 'number'
  },
  m: {
    alias: 'isMobile',
    describe: 'Whether the meta viewport tag is taken into account',
    default: false,
    type: 'boolean'
  },
  t: {
    alias: 'hasTouch',
    describe: 'Specifies if viewport supports touch events',
    default: false,
    type: 'boolean'
  },
  l: {
    alias: 'isLandscape',
    describe: 'Specifies if viewport is in landscape mode',
    default: false,
    type: 'boolean'
  },
  a: {
    alias: 'userAgent',
    describe: 'Specific user agent to use in this page',
    default: '',
    type: 'string'
  }
};

const puppeteerOptions = {
  executablePath: '/usr/bin/chromium-browser',
  args: ['--disable-dev-shm-usage', '--no-sandbox']
};

module.exports = async ({
  cbYargs = async argv => argv,
  cbPage = async (page, argv, name) => {}
}) => {
  try {
    const yargsInstance = await cbYargs(yargs);
    const argv = yargsInstance
      .command({ command: '$0 [options] <url>' })
      .options(argsPuppeteer)
      .group(Object.keys(argsPuppeteer), 'Browser Options:')
      .help('help')
      .version(false)
      .wrap(null).argv;

    if (!/^([a-z0-9-_.]|<date>)+$/i.test(argv.name)) {
      throw new Error(
        'The file name can only contain the following characters: "a-z0-9-_." or "<date>"'
      );
    }

    const name = argv.name
      .trim()
      .replace(
        /<date>/i,
        luxon.DateTime.local().toFormat('yyyy-MM-dd_HH-mm-ss')
      );

    console.log('Browser will be started');
    const browser = await puppeteer.launch(puppeteerOptions);
    const context = await browser.createIncognitoBrowserContext();
    const page = await context.newPage();

    if (argv.userAgent.trim().length > 0) {
      await page.setUserAgent(argv.userAgent);
    }

    await page.setViewport({
      width: argv.width,
      height: argv.height,
      deviceScaleFactor: argv.deviceScaleFactor,
      hasTouch: argv.hasTouch === true,
      isLandscape: argv.isLandscape === true,
      isMobile: argv.isMobile === true
    });

    console.log('Load the webpage');
    await page.goto(argv.url, { waitUntil: 'networkidle0' });

    const sHeight = await page.evaluate(() => document.body.scrollHeight);

    if (sHeight) {
      const nHeight = parseInt(sHeight, 10);

      if (nHeight > argv.height) {
        // Page height is greater than viewport
        await page.setRequestInterception(true);

        const ids = new Map();
        page.on('requestfailed', request => ids.delete(request._requestId));
        page.on('requestfinished', request => ids.delete(request._requestId));
        page.on('request', request => {
          ids.set(request._requestId, true);
          request.continue();
        });

        console.log('Scroll through the page');
        const steps = Math.ceil(nHeight / argv.height);

        // Scrolls down the screen step by step
        for (let step = 1; step < steps; step += 1) {
          await page.evaluate(h => window.scrollBy(0, h), argv.height);
          await page.waitFor(100);
        }

        // reset
        await page.evaluate(() => window.scrollBy(0, 0));

        do {
          await page.waitFor(100);
        } while (ids.size > 0);
      }
    }

    await cbPage(page, argv, name);

    console.log('Browser will be closed');
    await browser.close();
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
};
