/*
  Script for filtering rss feeds for newsboat

  Usage (in newsboat urls):
  "filter:~/scripts/newsboat/filter-tagesschau.js:https://www.tagesschau.de/xml/rss2"

  Dont forget to install the dependencies.
*/

const convert = require( "xml-js" );

function filter( blocklist, cb ) {
  const chunks = [];
  process.stdin.on( "readable", () => {
    const chunk = process.stdin.read();
    if ( chunk !== null )
      chunks.push( chunk.toString() );
  } );

  process.stdin.on( "end", () => {
    let data = JSON.parse( convert.xml2json( chunks.join( "" ) ) );

    data = cb( data, blocklist );

    const out = convert.json2xml( JSON.stringify( data ) );
    process.stdout.write( out );
  } );
}

module.exports = filter;
