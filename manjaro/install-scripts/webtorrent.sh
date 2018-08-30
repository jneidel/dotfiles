# check for latest version: https://github.com/webtorrent/webtorrent-desktop/releases
WEBTV=0.20.0;

echo "##### install webtorrent #####";

wget https://github.com/webtorrent/webtorrent-desktop/releases/download/v$WEBTV/WebTorrent-v$WEBTV-linux.zip -O ~/.bin/webtorrent-latest.zip;
cd ~/.bin;
unzip webtorrent-latest.zip;
rm webtorrent-latest.zip;

echo "create symlink";
ln -sf WebTorrent-linux-x64/WebTorrent webtorrent;

