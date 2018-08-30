GPG=/usr/bin/gpg
GPG1=~/.bin/gpg1/bin/gpg
GPG2=/usr/bin/gpg2

GPGV=$(readlink -f $GPG)

if [ $GPGV == $GPG2 ]; then
  sudo ln -s -f $GPG1 $GPG
else
  sudo ln -s -f $GPG2 $GPG
fi

