#!/usr/bin/env node
"use strict";

const { spawn } = require('child_process');
const elm = spawn('elm', ['make', 'src/Main.elm', '--debug', '--output=tmp/elm-css.js']);

elm.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

elm.stderr.on('data', (data) => {
  console.error(`stderr: ${data}`);
});

elm.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});