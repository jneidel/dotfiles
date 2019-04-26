#! /usr/bin/env node

const filter = require("./filter-rss");

const blacklist = ["Briefing", "Pope"];

function exclude(data, blacklist) {
  function filter(x) {
    if (x.name === "item") {
      const { text } = x.elements[0].elements[0];
      return !blacklist.filter(x => text.match(x)).length;
    } else {
      return true;
    }
  }

  data.elements[0].elements[0].elements = data.elements[0].elements[0].elements.filter(
    filter,
  );

  return data;
}

filter(blacklist, exclude);
