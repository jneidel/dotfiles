INSTALL_LOCATION=$HOME

echo "# Installing gpg"
V="2.2.13"; # see for new versions: https://gnupg.org/ftp/gcrypt/gnupg

TAR=./gpg-$V.tar.bz2
DIR=gnupg-$V

echo "## Download v"$V
wget https://gnupg.org/ftp/gcrypt/gnupg/gnupg-$V.tar.bz2 -O $TAR
tar xf $TAR
rm $TAR
cd $DIR

echo "## configure"
./configure --prefix=$INSTALL_LOCATION
echo "## make"
make
echo "## make install"
make install

echo "## Cleanup $DIR"
cd ..
rm -rf $DIR

## Installation notes
# You might be missing dependencies, which configure will tell you about.

# If you install in your $HOME, you might want to set your
# LD_LIBRARY_PATH and LD_RUN_PATH env variables
# as configure might not find your dependencies otherwise
# Example:
#   export LD_LIBRARY_PATH=/home/jneidel/lib:/lib:/lib64:/lib:/lib64
#   export LD_RUN_PATH=/home/jneidel/lib

## Errors:
# Error:
#   undefined reference to clock_gettime
# Fix:
#   export CFLAGS=-lrt
# See:
#   https://stackoverflow.com/a/2418175
#   https://www.linuxquestions.org/questions/linux-newbie-8/error-couldn%27t-find-clock_gettime-817786/

# Error:
#   IN_EXCL_UNLINK undeclared
# Fix:
#  # Get the file which uses IN_EXCL_UNLINK
#  grep --line-number --with-filename --no-messages --recursive IN_EXCL_UNLINK 
#  # and remove the call to IN_EXCL_UNLINK
# See:
#   https://lists.gt.net/gnupg/users/80319

