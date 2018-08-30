BASE=https://raw.githubusercontent.com/jneidel/dotfiles/master/;
LINUX=$BASE"manjaro/";
NODEV=10.5.0; # latest: https://nodejs.org/en/

echo "##### installnode v"$NODEV" #####"; 
wget https://nodejs.org/dist/v$NODEV/node-v$NODEV-linux-x64.tar.xz -O ~/.bin/node-latest.tar.xz; # node current linux binaries
cd ~/.bin;
tar xf node-latest.tar.xz;
echo "tar xf";
rm node-latest.tar.xz;
mv node-v$NODEV-linux-x64 node-$NODEV;
ln -sf node-$NODEV/bin/node node;
echo "created node symlink";
ln -sf node-$NODEV/lib/node_modules/npm/bin/npm-cli.js npm;
echo "created npm symlink";
ln -sf node-$NODEV/lib/node_modules/npm/bin/npx-cli.js npx;
echo "created npx symlink";

