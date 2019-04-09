#! /usr/bin/env node

const filter = require("./filter-rss");

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
  "Paketzusteller",
  "Nissan",
  "Gladbach",
  "Hoffenheim",
  "Gorch-Fock",
  "Tagesspiegel",
  "Airbus",
];

function exclude(data) {
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
  return data;
}

filter(blocklist, exclude);
