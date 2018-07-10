echo "##### install gpg1 #####"

wget https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.23.tar.bz2 -O ./gpg-1.4.tar.bz2;
tar xf gpg-1.4.tar.bz2;
rm gpg-1.4.tar.bz2;
cd gnupg-1.4.23;

./configure --prefix=/home/jneidel/.bin/gpg1;
make;
make install;

echo "cleanup gpg install";
rm -rf gnupg-1.4.23;

