#! /usr/bin/env node

const filter = require("./filter-rss");

const blocklist = [
  "DFB",
  "THW",
  "DHB",
  "Bundesliga",
  "Gladbach",
  "Hoffenheim",
  "FC Augsburg",
  "Hannover 96",
  "Champions League",
  "Mönchengladbach",
  "Europa League",
  "Trainer",
  "Handball",
  "Boxer",
  "Boxen",
  "Formel-1",
  "Poliz",
  "Paketzusteller",
  "Gedenken",
  "Angst",
  "Libyen",
  "Israel",
  "Ruanda",
  "Venezuela",
  "Istanbul",
  "München",
  "Algerien",
  "Barcelona",
  "Österreich:",
  "AfD",
  "AKP",
  "Nissan",
  "Gorch-Fock",
  "Tagesspiegel",
  "Airbus",
  "laut Umfrage",
  "Bundeswehr",
  "Verspätung",
  "deutschen Pass",
  "Bilder:",
];

function exclude(data, blocklist) {
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
