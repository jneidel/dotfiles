#!/usr/bin/env node

const { sync: parser } = require("conventional-commits-parser");
const capitalize = s => s[0].toUpperCase() + s.slice(1);

const scopes = {};

process.stdin
  .on('data', chunk => {
    String(chunk).split("\n").filter( s => s ).forEach( str => {
      const commitStr = str.replace("\\n", "\n");
      const commit = parser( commitStr, {} );
      const scope = commit.scope || "repo";
      const hash = commit.body;
      const message = capitalize( commit.subject );

      if ( !scopes[scope] ) {
        scopes[scope] = [];
      }
      const markdownEntry = `- ${message} ([${hash}](https://github.com/jneidel/dotfiles/commit/${hash}))`
      scopes[scope].push( markdownEntry );
    });
  })
  .on('end', () => {
    const scopeForAppsWithFewCommits = "other applications";
    const numberOfCommitsToCountAsFew = 1;

    const scopesWithOneCommitGrouped = Object.entries(scopes)
      .reduce( (acc, [scope, commits]) => {
        if ( commits.length > numberOfCommitsToCountAsFew ) {
          acc[scope] = commits;
        } else {
          if ( !acc[scopeForAppsWithFewCommits] )
            acc[scopeForAppsWithFewCommits] = []

          const scopedCommit = `- ${scope}: ${commits[0].slice(2)}`;
          acc[scopeForAppsWithFewCommits].push( scopedCommit );
        }
        return acc;
      }, {} );
    const markdownListOfCommitsSortedByScope = Object.entries( scopesWithOneCommitGrouped )
      .sort( ( [ s1, v1 ], [ s2, v2 ] ) => {
        if ( s2 === scopeForAppsWithFewCommits )
          return -1;
        else
          return v1.length > v2.length ? -1 : 1;
      } )
      .map( ([scope, commits] ) => {
        return `## ${scope}
${commits.join("\n")}
`;
      } ).join("\n")

    process.stdout.write( encodeURIComponent( markdownListOfCommitsSortedByScope ) );
  });
