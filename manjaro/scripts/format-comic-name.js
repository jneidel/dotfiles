#! /usr/bin/env node

/*
 * Converts getcomic.info filenames:
 *
 * Input format:  Oblivion Song 011 (2019) (Digital) (Zone-Empire).cbr
 * Output format: oblivion-song-011.cbr
 *
 * See rncomic for usage information
 */

let nameRaw = process.argv[2];

function createName( name, issue ) {
  name = name.toLowerCase();
  name = name.split( " " ).join( "-" )

  return `${name}-${issue}`
}

let [ name, ...rest ] = nameRaw.split( "." )
const nameExt = rest[rest.length-1]

const completePath = name.split( "/" )
name = completePath.pop()

const [ , seriesName, issue ] = name.match( /^(.*?)\s(\d\d\d)/ )

const formattedName = `${createName( seriesName, issue )}.${nameExt}`
completePath.push(formattedName);

const result = completePath.join("/")

console.log(result)

