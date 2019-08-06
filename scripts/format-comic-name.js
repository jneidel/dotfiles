#! /usr/bin/env node

/*
 * Converts getcomic.info filenames:
 *
 * Input format:  Oblivion Song 011 (2019) (Digital) (Zone-Empire).cbr
 * Output format: oblivion-song-011.cbr
 *
 * See rename-comic for usage information
 */

const nameRaw = process.argv[2];
const onlySeries = process.argv[3] == "nameonly"

function createName( name, issue ) {
  name = name.toLowerCase();
  name = name.split( " " ).join( "-" );

  return `${name}-${issue}`;
}

let [ name, ...rest ] = nameRaw.split( ".cb" );
const nameExt = `cb${rest[rest.length - 1]}`;

const completePath = name.split( "/" );
name = completePath.pop();

const [ , seriesName, issue ] = name.match( /^(.*?)\s(\d\d\d)/ );

const formattedName = `${createName( seriesName, issue )}.${nameExt}`;

// If you want the complete path converted use result instead of formattedName:
// completePath.push( formattedName );
// const result = completePath.join( "/" );

if ( !onlySeries ) {
  console.log( formattedName );
} else {
  console.log( seriesName.toLowerCase().split( " " ).join( "-" ) )
}

