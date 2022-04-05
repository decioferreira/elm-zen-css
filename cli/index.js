#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const watch = require('node-watch');

const { program } = require('commander');
const { spawn, execSync } = require('child_process');
const { Elm } = require(path.resolve(__dirname, './converter.js'));

const run = (file, options) => {
  const app = Elm.Main.init();

  if (options.css) {
    app.ports.resultCss.subscribe((data) => {
      fs.writeFileSync(path.resolve(__dirname, '../converter/tmp/ExportCss.elm'), data);

      let elmMakeSucceeded = false;

      try {
        execSync(
          `pushd ${path.resolve(__dirname, '../converter/')} && elm make tmp/ExportCss.elm --output=tmp/export-css.js --optimize && popd`,
          { shell: '/bin/bash', stdio: 'pipe' }
        );
        elmMakeSucceeded = true;
      } catch (error) {
        console.log(error.stderr.toString());
      }

      if (elmMakeSucceeded) {
        delete require.cache[require.resolve('../converter/tmp/export-css.js')];

        const exportCss = require('../converter/tmp/export-css.js');
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