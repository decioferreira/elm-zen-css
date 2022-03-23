#!/usr/bin/env node
"use strict";

const { Elm } = require('./tmp/elm-css.js');
const fs = require("fs");

const app = Elm.Main.init();

app.ports.sendMessage.subscribe((data) => {
  fs.writeFileSync("./tmp/Stylesheet.elm", data);
});

app.ports.messageReceiver.send(fs.readFileSync("./example/src/Stylesheet.elm", "utf8"));