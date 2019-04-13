#! /usr/bin/env node

const { promisify } = require( "util" );
const fs = require( "fs" );
const path = require( "path" );
const writeFile = promisify( fs.writeFile );

const base = require( "./base" );

const paths = [
  {
    in : "/home/jneidel/.eslint/js",
    out: "/home/jneidel/.eslintrc",
  },
  {
    in : "/home/jneidel/.eslint/ts",
    out: "/home/jneidel/.eslintrc-ts",
  },
];

paths.forEach( ( { in: inPath, out: outPath } ) => {
  const configData = require( inPath );

  // Copy parser, env, etc
  const config = Object.assign( {}, base, configData );
  // Merge rules
  config.rules = Object.assign( {}, base.rules, configData.rules );
  // Merge plugins
  config.plugins = configData.plugins ?
    base.plugins.concat( configData.plugins ) :
    config.plugins;
  // Merge extends
  config.extends = configData.extends ?
    base.extends.concat( configData.extends ) :
    config.extends;

  writeFile( outPath, JSON.stringify( config, null, 2 ) );
} );
