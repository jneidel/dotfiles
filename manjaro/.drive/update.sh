~/.bin/gpg1/bin/gpg --batch --yes -r 7DFD16FA -o ~/.drive/main.kdbx.gpg -e ~/.main.kdbx;
~/.bin/gpg1/bin/gpg --batch --yes -r 7DFD16FA -o ~/.drive/rclone.conf.gpg -e ~/.config/rclone/rclone.conf;
~/.bin/gpg1/bin/gpg --batch --yes -r 7DFD16FA -o ~/.drive/musiclibrary.db.gpg -e ~/.config/beets/musiclibrary.db;

rclone sync ~/.drive drive:sync;

