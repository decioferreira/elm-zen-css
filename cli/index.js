#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const tempDir = require('temp-dir');
const watch = require('node-watch');

const { program } = require('commander');
const { spawn, execSync } = require('child_process');
const { Elm } = require(path.resolve(__dirname, './converter.js'));

const temporaryDirectory = () => {
  const hrTime = process.hrtime();
  const directory = path.join(tempDir, `elmzencss_${hrTime[0] * 1000000000 + hrTime[1]}`);
  fs.mkdirSync(directory);
  return directory;
}

const run = (file, options) => {
  const app = Elm.Main.init();
  const tmpDirectory = temporaryDirectory();

  if (options.css) {
    app.ports.resultCss.subscribe((data) => {
      fs.writeFileSync(path.resolve(tmpDirectory, 'ExportCss.elm'), data);

      let elmMakeSucceeded = false;

      try {
        execSync(
          `elm make ${tmpDirectory}/ExportCss.elm --output=${tmpDirectory}/export-css.js --optimize`,
          { shell: '/bin/bash', stdio: 'pipe' }
        );
        elmMakeSucceeded = true;
      } catch (error) {
        console.log(error.stderr.toString());
      }

      if (elmMakeSucceeded) {
        delete require.cache[path.resolve(tmpDirectory, 'export-css.js')];

        const exportCss = require(`${tmpDirectory}/export-css.js`);
        const exportCssApp = exportCss.Elm.ExportCss.init();

        exportCssApp.ports.sendMessage.subscribe((data) => {
          fs.writeFileSync(options.css, data);
        });

        exportCssApp.ports.messageReceiver.send(null);
      }
    });

    app.ports.convertToCss.send(fs.readFileSync(file, 'utf8'));
  }

  if (options.elm) {
    app.ports.resultProd.subscribe((data) => {
      fs.writeFileSync(options.elm, data);
    });

    app.ports.convertToProd.send({
      name: [path.basename(options.elm, path.extname(options.elm))],
      src: fs.readFileSync(file, 'utf8')
    });
  }
};

program
  .description('Elm Zen CSS')
  .option('-c, --css <css-file>', 'output CSS file')
  .option('-e, --elm <elm-file>', 'output production version file')
  .option('-w, --watch', 'watch file changes')
  .argument('<stylesheet-elm-file>', 'watch file changes')
  .action((file, options) => {
    if (options.watch) {
      run(file, options);

      watch(file, (_evt, _name) => {
        run(file, options);
      });
    } else {
      run(file, options);
    }
  })
  .parse();
