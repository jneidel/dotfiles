~/.bin/gpg1/bin/gpg --batch --yes -r 7DFD16FA -o ~/.drive/main.kdbx.gpg -e ~/.main.kdbx;
~/.bin/gpg1/bin/gpg --batch --yes -r 7DFD16FA -o ~/.drive/rclone.conf.gpg -e ~/.config/rclone/rclone.conf;

rclone sync ~/.drive drive:sync;

