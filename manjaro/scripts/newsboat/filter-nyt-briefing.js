#! /usr/bin/env node

const filter = require("./filter-rss");

const whitelist = ["Briefing"];

function include(data, whitelist) {
  function filter(x) {
    if (x.name === "item") {
      const { text } = x.elements[0].elements[0];
      return whitelist.filter(x => text.match(x)).length;
    } else {
      return true;
    }
  }

  data.elements[0].elements[0].elements = data.elements[0].elements[0].elements.filter(
    filter,
  );

  return data;
}

filter(whitelist, include);
