gpg1 --batch --yes -r 7DFD16FA -o ~/.drive/main.kdbx.gpg -e ~/.main.kdbx;
gpg1 --batch --yes -r 7DFD16FA -o ~/.drive/rclone.conf.gpg -e ~/.config/rclone/rclone.conf;

rclone sync ~/.drive drive:sync;

