#! /usr/bin/env node

/*
  Script for filtering rss feeds for newsboat

  Usage (in newsboat urls):
  "filter:~/scripts/newsboat/filter-tagesschau.js:https://www.tagesschau.de/xml/rss2"

  Dont forget to install the dependencies.
*/

const blocklist = [
  "Poliz",
  "DFB",
  "Libyen",
  "THW",
  "DHB",
  "Bundesliga",
  "Gedenken",
  "Angst",
  "Israel",
  "Ruanda",
  "Venezuela",
  "AfD",
  "Boxer",
  "Istanbul",
  "AKP",
];

const convert = require("xml-js");

process.stdin.on("readable", () => {
  const chunk = process.stdin.read();
  if (chunk !== null) {
    const data = JSON.parse(convert.xml2json(chunk.toString()));

    data.elements[1].elements[0].elements = data.elements[1].elements[0].elements.filter(
      x => {
        if (x.name === "item") {
          const { text } = x.elements[0].elements[0];
          return !blocklist.filter(x => text.match(x)).length;
        } else {
          return true;
        }
      },
    );

    /*    Data.elements[1].elements[0].elements.forEach( x => { */
    // if ( x.name === "item" ) console.log( x.elements[0].elements[0].text );
    /* } ); */

    const out = convert.json2xml(JSON.stringify(data));
    process.stdout.write(out);
  }
});
