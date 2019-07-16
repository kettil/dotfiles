const common = require('./common');

const argsDocument = {
  n: {
    alias: 'name',
    describe: 'Filename from screenshot (without extension)',
    default: 'pdf-<date>',
    type: 'string'
  },
  scale: {
    describe: 'Scale of the webpage rendering',
    default: 1,
    type: 'number'
  },
  printBackground: {
    describe: 'Print background graphics',
    default: true,
    type: 'boolean'
  },
  landscape: {
    describe: 'Paper orientation',
    default: false,
    type: 'boolean'
  },
  pageRanges: {
    describe: 'Paper ranges to print, e.g., '1-5, 8, 11-13'',
    type: 'string'
  },
  pageFormat: {
    describe:
      'Paper format (if set, takes priority over width or height options)',
    default: 'A4',
    type: 'string'
  },
  pageWidth: {
    describe: 'Paper width, accepts values labeled with units',
    type: 'string'
  },
  pageHeight: {
    describe: 'Paper height, accepts values labeled with units',
    type: 'string'
  },
  marginTop: {
    describe: 'Top margin, accepts values labeled with units',
    type: 'string'
  },
  marginRight: {
    describe: 'Right margin, accepts values labeled with units',
    type: 'string'
  },
  marginBottom: {
    describe: 'Bottom margin, accepts values labeled with units',
    type: 'string'
  },
  marginLeft: {
    describe: 'Left margin, accepts values labeled with units',
    type: 'string'
  }
};

common({
  cbYargs: async yargs => {
    return yargs
      .scriptName('my-script')
      .options(argsDocument)
      .group(Object.keys(argsDocument), 'PDF Options:');
  },

  cbPage: async (page, argv, name) => {
    if (argv.pageWidth && argv.pageHeight) {
      argv.pageFormat = undefined;
    } else {
      argv.pageWidth = undefined;
      argv.pageHeight = undefined;
    }

    const documentOptions = {
      path: `${name}.pdf`,
      scale: argv.scale,
      printBackground: argv.printBackground,
      landscape: argv.landscape,
      pageRanges: argv.pageRanges,
      format: argv.pageFormat,
      width: argv.pageWidth,
      height: argv.pageHeight
    };

    if (
      argv.marginTop &&
      argv.marginRight &&
      argv.marginBottom &&
      argv.marginLeft
    ) {
      documentOptions.margin = {
        top: argv.marginTop,
        right: argv.marginRight,
        bottom: argv.marginBottom,
        left: argv.marginLeft
      };
    }

    await page.emulateMedia('screen');

    console.log('Document will be created');
    await page.pdf(documentOptions);
  }
});
