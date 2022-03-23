#!/usr/bin/env node
"use strict";

const { Elm } = require('./tmp/converter.js');
const fs = require("fs");

const app = Elm.Converter.init();

app.ports.subscriber.subscribe((data) => {
  fs.writeFileSync("./tmp/StylesheetProd.elm", data);
});

app.ports.convertToProd.send({ name: ["StylesheetProd"], src: fs.readFileSync("./example/src/Stylesheet.elm", "utf8") });
