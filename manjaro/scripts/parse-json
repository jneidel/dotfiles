#! /usr/bin/env node

process.stdin.on('readable', () => {
  const chunk = process.stdin.read();
  if (chunk !== null) {
    const data = JSON.parse( chunk.toString())
    process.stdout.write( JSON.stringify( data, null, 2 ));
  }
});

