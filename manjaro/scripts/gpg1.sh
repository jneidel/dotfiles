echo "##### install gpg1 #####"

wget https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.23.tar.bz2 -O ./gpg-1.4.tar.bz2;
tar xf gpg-1.4.tar.bz2;
rm gpg-1.4.tar.bz2;
cd gnupg-1.4.23;

./configure --prefix=/home/jneidel/.bin;
make;
make install;

echo "cleanup gpg install";
mv ~/.bin/bin/gpg ~/.bin/gpg1;
rm -rf ~/.bin/share;
rm -rf ~/.bin/libexec;
rm -rf ~/.bin/bin;
rm -rf gnupg-1.4.23;

