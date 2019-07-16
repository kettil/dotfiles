const common = require('./common');

const argsScreenshot = {
  n: {
    alias: 'name',
    describe: 'Filename from screenshot (without extension)',
    default: 'screenshot-<date>',
    type: 'string'
  },
  e: {
    alias: 'extension',
    describe: 'Filename extension [png|jpg]',
    default: 'png',
    type: 'string'
  },
  f: {
    alias: 'fullPage',
    describe: 'When true, takes a screenshot of the full scrollable page',
    default: true,
    type: 'boolean'
  },
  q: {
    alias: 'quality',
    describe:
      'The quality of the image, between 0-100 (not applicable to png images)',
    default: 80,
    type: 'number'
  },
  clipX: {
    describe: 'x-coordinate of top-left corner of clip area',
    type: 'number'
  },
  clipY: {
    describe: 'y-coordinate of top-left corner of clip area',
    type: 'number'
  },
  clipW: {
    describe: 'width of clipping area',
    type: 'number'
  },
  clipH: {
    describe: 'height of clipping area',
    type: 'number'
  }
};

common({
  cbYargs: async yargs => {
    return yargs
      .scriptName('my-script')
      .options(argsScreenshot)
      .group(Object.keys(argsScreenshot), 'Screenshot Options:');
  },

  cbPage: async (page, argv, name) => {
    const ext = argv.extension.trim().toLowerCase();

    if (['png', 'jpg'].indexOf(ext) === -1) {
      throw new Error('The extension can only be "png" or "jpg"');
    }

    const screenshotOptions = {
      path: `${name}.${ext}`,
      type: ext === 'jpg' ? 'jpeg' : ext,
      quality: ext === 'jpg' ? argv.quality : undefined,
      fullPage: argv.fullPage === true
    };

    if (argv.clipX && argv.clipY && argv.clipW && argv.clipH) {
      screenshotOptions.clip = {
        x: argv.clipX,
        y: argv.clipY,
        width: argv.clipW,
        height: argv.clipH
      };
    }

    console.log('Screenshot will be created');
    await page.screenshot(screenshotOptions);
  }
});
