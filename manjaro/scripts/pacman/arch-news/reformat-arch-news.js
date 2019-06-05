#! /usr/bin/env node

// Reformat arch news rss feed
// at: https://www.archlinux.org/feeds/news
// to return a list of packages that require
// manual intervention in the format:
// pkg-name pkg-version arch-news-link
//
// To test against installed pkgs pipe
// output into test-pkg
//
// Run by test-pkgs

const convert = require("xml-js");

const chunks = [];
process.stdin.on("readable", () => {
  const chunk = process.stdin.read();
  if (chunk !== null) chunks.push(chunk.toString());
});

process.stdin.on("end", () => {
  let data = JSON.parse(convert.xml2json(chunks.join("")));

  data.elements[0].elements[0].elements.forEach(item => {
    if (item.name === "item") {
      const text = item.elements[0].elements[0].text;
      const link = item.elements[1].elements[0].text;
      if (text && text.match("intervention")) {
        let str = text.replace( /\w*\srequires?\s\w*\s?intervention$/, "" )
        str = str.replace( /->.*$/, "" );
        str = str.replace( /\sand\s/, ` ${link}\n` );
        str = str.replace( />=/, " " );
        str = str.trim()
        console.log( str, link );
      }
    }
  });
});
