#!/usr/bin/env node
"use strict";

const { Elm } = require('./tmp/stylesheet.js');
const fs = require("fs");

const app = Elm.Stylesheet.init();

app.ports.sendMessage.subscribe((data) => {
  fs.writeFileSync("./tmp/app.css", data);
});

app.ports.messageReceiver.send(null);