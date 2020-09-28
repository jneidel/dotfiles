#! /usr/bin/env node

const path = require( "path" );
const { promisify } = require( "util" );
const fs = require( "fs" );
const writeFile = promisify( fs.writeFile );

const base = require( "./base" );

const dir = file => path.resolve( __dirname, file );
const paths = [
  {
    in : dir( "js" ),
    out: dir( "eslintrc" ),
  },
  {
    in : dir( "ts" ),
    out: dir( "eslintrc-ts" ),
  },
];

paths.forEach( ( { in: inPath, out: outPath } ) => {
  const configData = require( inPath );

  // Copy parser, env, etc
  const config = Object.assign( {}, base, configData );
  // Merge rules
  config.rules = Object.assign( {}, base.rules, configData.rules );
  // Merge plugins
  config.plugins = configData.plugins
    ? base.plugins.concat( configData.plugins )
    : config.plugins;
  // Merge extends
  config.extends = configData.extends
    ? base.extends.concat( configData.extends )
    : config.extends;

  writeFile( outPath, JSON.stringify( config, null, 2 ) );
} );
