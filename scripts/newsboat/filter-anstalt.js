#! /usr/bin/env node

const filter = require("./filter-rss");

function anstalt(data) {
  const pattern = "Die Anstalt vom";

  data.elements[0].elements[0].elements = data.elements[0].elements[0].elements.filter(
    x => {
      if (x.name === "item") {
        const { text } = x.elements[0].elements[0];
        return text.match(pattern)
      } else {
        return false;
      }
    },
  );

  /*    Data.elements[1].elements[0].elements.forEach( x => { */
  // if ( x.name === "item" ) console.log( x.elements[0].elements[0].text );
  /* } ); */
  return data;
}

filter(anstalt);
