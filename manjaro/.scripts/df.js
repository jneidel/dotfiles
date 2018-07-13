#! /usr/bin/env node

const df = require( "@sindresorhus/df" );

df().then( x => x.filter( x => x.filesystem.match( /sd(\w\d)/ ) ) ).then( x=>console.log(x))
