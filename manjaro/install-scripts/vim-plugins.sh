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

echo "install syntax plugins (js, js-libs, pug, html, ts, i3)"
git clone https://github.com/pangloss/vim-javascript.git $VB/syntax-javascript
git clone https://github.com/leafgarland/typescript-vim.git $VB/syntax-typescript
git clone https://github.com/othree/javascript-libraries-syntax.vim.git $VB/syntax-javascript-libs
git clone https://github.com/mxw/vim-jsx.git $VB/syntax-jsx
git clone https://github.com/styled-components/vim-styled-components.git $VB/syntax-styled-components
git clone https://github.com/digitaltoad/vim-pug.git $VB/syntax-pug
git clone https://github.com/othree/html5.vim.git $VB/syntax-html
git clone https://github.com/PotatoesMaster/i3-vim-syntax.git $VB/syntax-i3

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

echo "install fugitive"
git clone https://github.com/tpope/vim-fugitive.git $VB/fugitive;

echo "install nerdcommenter"
git clone https://github.com/scrooloose/nerdcommenter.git $VB/nerdocommenter;

echo "install numbers"
git clone https://github.com/myusuf3/numbers.vim.git $VB/numbers;

echo "install tabular"
git clone git://github.com/godlygeek/tabular.git $VB/tabular;

echo "install vim-tmux-navigator"
git clone https://github.com/christoomey/vim-tmux-navigator.git $VB/tmux-vim-navigator;

echo "install goyo"
git clone https://github.com/junegunn/goyo.vim $VB/goyo;

echo "install tmux-focus-events"
git clone https://github.com/tmux-plugins/vim-tmux-focus-events.git $VB/tmux-focus-events;

echo "install prettier"
git clone https://github.com/prettier/vim-prettier $VB/prettier

echo "install DeleteTrailingWhitespace"
git clone https://github.com/vim-scripts/DeleteTrailingWhitespace.git $VB/DeleteTrailingWhitespace

# echo "install syntastic, eslint (dependency)"
# git clone --depth=1 https://github.com/vim-syntastic/syntastic.git $VB/syntastic;
# npm i -g eslint;

#echo "install YouCompleteMe"
#git clone https://github.com/Valloric/YouCompleteMe.git $VB/YouCompleteMe;
#rmdir $VB/YouCompleteMe/third_party/ycmd;
#git clone https://github.com/Valloric/ycmd.git $VB/YouCompleteMe/third_party/ycmd;
#rmdir $VB/YouCompleteMe/third_party/ycmd/third_party/cregex;
#git clone https://github.com/micbou/regex.git $VB/YouCompleteMe/third_party/ycmd/third_party/cregex;
#cd $VB/YouCompleteMe;
#mkdir ycm-build;
#mkdir regex-build;
#cd ycm-build;
#cmake -G "Unix Makefiles" . ../third_party/ycmd/cpp;
#cd ../regex-build;
#cmake -G "Unix Makefiles" . ../third_party/ycmd/third_party/cregex;
#cmake --build . --target _regex --config Release;
#npm install --production --prefix=third_party/ycmd/third_party/tern_runtime;

