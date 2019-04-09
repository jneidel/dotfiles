/*
  Script for filtering rss feeds for newsboat

  Usage (in newsboat urls):
  "filter:~/scripts/newsboat/filter-tagesschau.js:https://www.tagesschau.de/xml/rss2"

  Dont forget to install the dependencies.
*/

const convert = require( "xml-js" );

function filter( blocklist, cb ) {
  process.stdin.on( "readable", () => {
    const chunk = process.stdin.read();
    if ( chunk !== null ) {
      let data = JSON.parse( convert.xml2json( chunk.toString() ) );

      data = cb( data );

      const out = convert.json2xml( JSON.stringify( data ) );
      process.stdout.write( out );
    }
  } );
}

module.exports = filter;
