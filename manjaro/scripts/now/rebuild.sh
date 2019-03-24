#! /bin/bash

SERVER=u

if [[ $1 = "--help" ]] || [[ $1 = "help" ]]; then
  echo "$ rebuild.sh"
  echo "Run 'npm run build' in '~/html' on my server."
  exit
fi

ssh $SERVER 'PATH="/package/host/localhost/nodejs-10/bin:$PATH"; npm run build --prefix ~/html'

