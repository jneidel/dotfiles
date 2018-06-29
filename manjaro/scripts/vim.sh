echo "##### vim #####"

echo "install vim configs";
wget $LINUX".vimrc" -O ~/.vimrc;
mkdir -p ~/.vim/autoload;
wget $LINUX".vim/autoload/oldhope.vim" -O ~/.vim/autoload/oldhope.vim;
mkdir -p ~/.vim/colors;
wget $LINUX".vim/colors/old-hope.vim" -O ~/.vim/colors/old-hope.vim;
mkdir -p ~/.vim/spell;
wget $LINUX".vim/spell/en.utf-8.add" -O ~/.vim/spell/en.utf-8.add;
wget $LINUX".vim/spell/en.utf-8.add.spl" -O ~/.vim/spell/en.utf-8.add.spl;
mkdir -p ~/.vim/tmp;
mkdir -p ~/.vim/swap;
mkdir -p ~/.vim/backup;
mkdir -p ~/.vim/bundle;

echo "##### vim plugins #####"
VB=~/.vim/bundle;

echo "install pathogen"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

echo "install nerdtree"
git clone https://github.com/scrooloose/nerdtree.git $VB/nerdtree;
echo "in vim run ':helptags ~/.vim/bundle/nerdtree/doc/' to install nerdtree docs"

echo "install sensible"
git clone git://github.com/tpope/vim-sensible.git $VB/sensible;

echo "install tagbar, universal-ctags (dependency)"
git clone https://github.com/majutsushi/tagbar.git $VB/tagbar;
git clone https://github.com/universal-ctags/ctags.git $VB/ctags;
cd $VB/ctags;
sh autogen.sh;
sh configure;
make;
sudo make install;
cd ..;
rm -rf ctags;

echo "install syntax plugins (js, js-libs, pug)"
git clone https://github.com/jelera/vim-javascript-syntax.git $VB/javascript-syntax;
git clone https://github.com/othree/javascript-libraries-syntax.vim.git $VB/javascript-libs-syntax;
git clone https://github.com/digitaltoad/vim-pug.git $VB/pug-syntax;

echo "install tern"
git clone https://github.com/ternjs/tern_for_vim.git $VB/tern;
cd $VB/tern;
npm install;

echo "install js indention"
cd $VB;
mkdir indent-js;
cd indent-js;
wget https://raw.githubusercontent.com/vim-scripts/JavaScript-Indent/master/indent/html.vim;
wget https://raw.githubusercontent.com/vim-scripts/JavaScript-Indent/master/indent/javascript.vim;

echo "install commander-t, ruby (dependency)"
sudo pacman -S ruby;
git clone https://github.com/wincent/command-t.git $VB/command-t;
cd $VB/command-t/ruby/command-t/ext/command-t;
ruby extconf.rb
make;

echo "install syntastic, eslint (dependency)"
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git $VB/syntastic;
npm i -g eslint;

echo "install fugitive"
git clone https://github.com/tpope/vim-fugitive.git $VB/fugitive;

echo "install nerdcommenter"
git clone https://github.com/scrooloose/nerdcommenter.git $VB/nerdocommenter;

echo "install simple-pairs"
git clone https://github.com/vim-scripts/simple-pairs.git $VB/simple-pairs;

echo "install YouCompleteMe"
git clone https://github.com/Valloric/YouCompleteMe.git $VB/YouCompleteMe;
rmdir $VB/YouCompleteMe/third_party/ycmd;
git clone https://github.com/Valloric/ycmd.git $VB/YouCompleteMe/third_party/ycmd;
rmdir $VB/YouCompleteMe/third_party/ycmd/third_party/cregex;
git clone https://github.com/micbou/regex.git $VB/YouCompleteMe/third_party/ycmd/third_party/cregex;
cd $VB/YouCompleteMe;
mkdir ycm-build;
mkdir regex-build;
cd ycm-build;
cmake -G "Unix Makefiles" . ../third_party/ycmd/cpp;
cd ../regex-build;
cmake -G "Unix Makefiles" . ../third_party/ycmd/third_party/cregex;
cmake --build . --target _regex --config Release;
npm install --production --prefix=third_party/ycmd/third_party/tern_runtime;

