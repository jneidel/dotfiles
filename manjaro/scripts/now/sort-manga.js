#! /usr/bin/env node

/* Todo:
 * - add paused state
 * - add regulality
 */

function createInfoUrl( manga ) {
  function inList( list, name ) {
    return ~list.indexOf( name )
  }

  function maybeSetWebtoon( name, url ) {
    function isWebtoon( name ) {
      const webtoons = [
        "Solo Leveling",
        "Unordinary",
      ]
      return inList( webtoons, name );
    }

    if ( isWebtoon( name ) )
      url = `https://www.webtoons.com/search?keyword=${name}`

    return url;
  }

  function maybeSetNone( name, url ) {
    const notFoundOnOtherPlatforms = {
      "Dice The Cube That Changes Everything": "https://www.webtoons.com/en/fantasy/dice/list?title_no=64",
      "The Legendary Moonlight Sculptor": "https://www.anime-planet.com/manga/the-legendary-moonlight-sculptor",
    }

    function isNone( name ) {
      return inList( Object.keys( notFoundOnOtherPlatforms ), name );
    }

    if ( isNone( name ) )
      url = notFoundOnOtherPlatforms[name];

    return url;
  }

  let url = `https://myanimelist.net/manga.php?q=${manga}`; // Default
  url = maybeSetWebtoon( manga, url );
  url = maybeSetNone( manga, url );

  url = new URL( url );
  return url;
}

function createGetCommand( manga, provider ) {
  return `mangareader-dl ${manga} -p ${provider}`
}

function createReadableName( name ) {
  let readable = name.split( "-" ).join( " " );
  readable = readable.split( "_" ).join( " " );
  readable = readable.replace(/\b\w/g, c => c.toUpperCase())

  return readable;
}

process.stdin.on( "readable", () => {
  const chunk = process.stdin.read();
  if ( chunk !== null ) {
    let data = JSON.parse( chunk.toString() );
    data = data.history;

    let names = Object.keys( data )
    names = names.sort()
    names = names.filter( name => data[name].subscribe )
    names = names.map( name => {
      const provider = data[name].provider;
      const chapter = data[name].chapter;
      const paused = data[name].paused || false;

      const readableName = createReadableName( name );

      const info = createInfoUrl( readableName );
      const get = createGetCommand( name, provider );

      return { readableName, chapter, info, get, paused }
    } )

    process.stdout.write( JSON.stringify( names, null, 2 ) );
  }
} );

