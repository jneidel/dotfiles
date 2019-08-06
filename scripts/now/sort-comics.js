#! /usr/bin/env node

function getPublisher( comic ) {
  const aftershock = [ "Dark Red", "Stronghold" ];
  const boom = [ "The Empty Man" ];

  return aftershock.includes( comic ) ? "aftershock" : boom.includes( comic ) ? "boom" : "image"; // Image is fallback
}

function createInfoUrl( comic ) {
  const publisher = getPublisher( comic );

  function formImageUrl( comic ) {
    return `https://duckduckgo.com/?q=site%3Aimagecomics.com%2Fcomics%2Fseries+${comic}`;
  }
  function formAftershockUrl( comic ) {
    return `https://duckduckgo.com/?q=site%3Aaftershockcomics.com+inurl%3A${comic}`
  }
  function formBoomUrl( comic ) {
return `https://duckduckgo.com/?q=site%3Awww.boom-studios.com%2Fseries+${comic}`
  }

  let url = publisher === "aftershock" ?
    formAftershockUrl( comic ) :
    publisher === "boom" ?
    formBoomUrl( comic ) :
    formImageUrl( comic );

  url = new URL( url )
  return url
}

function createGetUrl( comic ) {
  let url = `https://getcomics.info/?s=${comic}+1`
  url = new URL( url )
  return url
}

process.stdin.on( "readable", () => {
  const chunk = process.stdin.read();
  if ( chunk !== null ) {
    let data = JSON.parse( chunk.toString() );

    data = data
      .sort()
      .map( x => ({
        name: x[0],
        issue: x[1],
        info: createInfoUrl( x[0] ),
        get: createGetUrl( x[0] ),
        paused: x[2] || false,
      }) )

    process.stdout.write( JSON.stringify( data, null, 2 ) );
  }
} );

