#!/usr/bin/env node
"use strict";

const { program } = require('commander');
const { spawn, execSync } = require('child_process');
const { Elm } = require('./converter.js');
const fs = require("fs");
const path = require('path');
const watch = require('node-watch');

const run = (file, options) => {
  const app = Elm.Main.init();

  if (options.css) {
    app.ports.resultCss.subscribe((data) => {
      fs.writeFileSync('converter/tmp/Css.elm', data);
      execSync('pushd converter && elm make tmp/Css.elm --output=tmp/css.js --optimize && popd');

      const css = require('./converter/tmp/css.js');
      const cssApp = css.Elm.Stylesheet.init();

      cssApp.ports.sendMessage.subscribe((data) => {
        fs.writeFileSync(options.css, data);
      });

      cssApp.ports.messageReceiver.send(null);
    });

    app.ports.convertToCss.send(fs.readFileSync(file, "utf8"));
  }

  if (options.prod) {
    app.ports.resultProd.subscribe((data) => {
      fs.writeFileSync(options.prod, data);
    });

    app.ports.convertToProd.send({ name: [path.basename(options.prod)], src: fs.readFileSync(file, "utf8") });
  }
};

program
  .description('Elm CSS')
  .option('--css <css-file>', 'output CSS file')
  .option('--prod <prod-file>', 'output production version file')
  .option('--watch', 'watch file changes')
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