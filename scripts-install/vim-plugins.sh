color_echo() {
   printf "\033[1;31m$@\033[0m\n"
}

color_echo "# vim plugins"
# see: https://www.vi-improved.org/plugins

VB=~/.vim/bundle

color_echo "install pathogen" # plugin manager
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# echo "install nerdtree" # visual directory tree
# git clone https://github.com/scrooloose/nerdtree.git $VB/nerdtree;
# echo "in vim run ':helptags ~/.vim/bundle/nerdtree/doc/' to install nerdtree docs"

color_echo "## general"
color_echo "install sensible" # better defaults
git clone git://github.com/tpope/vim-sensible.git $VB/sensible

color_echo "install commentary" # (un)comment with: gcc
git clone https://github.com/tpope/vim-commentary.git $VB/commentary

color_echo "install numbers" # better relativenumber
git clone https://github.com/myusuf3/numbers.vim.git $VB/numbers

color_echo "install tabular" # align text
git clone git://github.com/godlygeek/tabular.git $VB/tabular

color_echo "install goyo" # clean writing interface
git clone https://github.com/junegunn/goyo.vim $VB/goyo

color_echo "install DeleteTrailingWhitespace" # needed?
git clone https://github.com/vim-scripts/DeleteTrailingWhitespace.git $VB/DeleteTrailingWhitespace

color_echo "install eunuch" # unix helper functions, eg. :Delete
git clone https://github.com/tpope/vim-eunuch.git $VB/eunuch

color_echo "install sneak" # faster / motion
git clone https://github.com/justinmk/vim-sneak.git $VB/sneak

color_echo "install vimcompletesme" # minimal completion
git clone https://github.com/ajh17/VimCompletesMe.git $VB/VimCompletesMe

color_echo "install targets" # better matching within (), etc
git clone https://github.com/wellle/targets.vim.git $VB/targets

color_echo "install surround" # easily edit html tags
git clone https://github.com/tpope/vim-surround.git $VB/surround

color_echo "install improved f/t"
git clone https://github.com/chrisbra/improvedft $VB/improvedft

color_echo "install lightline"
git clone https://github.com/itchyny/lightline.vim.git $VB/lightline

color_echo "## javascript"
color_echo "install syntax plugins (js, js-libs, pug, html, ts, i3)"
git clone https://github.com/pangloss/vim-javascript.git $VB/syntax-javascript
git clone https://github.com/leafgarland/typescript-vim.git $VB/syntax-typescript
git clone https://github.com/othree/javascript-libraries-syntax.vim.git $VB/syntax-javascript-libs
git clone https://github.com/mxw/vim-jsx.git $VB/syntax-jsx
git clone https://github.com/styled-components/vim-styled-components.git $VB/syntax-styled-components
git clone https://github.com/digitaltoad/vim-pug.git $VB/syntax-pug
git clone https://github.com/othree/html5.vim.git $VB/syntax-html
git clone https://github.com/PotatoesMaster/i3-vim-syntax.git $VB/syntax-i3

color_echo "install indent-js" # better js indention
git clone git@github.com:jason0x43/vim-js-indent.git $VB/indent-javascript

color_echo "install prettier" # run prettier on current buffer
git clone https://github.com/prettier/vim-prettier $VB/prettier

color_echo "install conquer of completion" # autocompletion
git clone -b release https://github.com/neoclide/coc.nvim.git $VB/coc

color_echo "## tmux"
color_echo "install vim-tmux-navigator" # navigate between vim and tmux
git clone https://github.com/christoomey/vim-tmux-navigator.git $VB/tmux-vim-navigator

color_echo "install tmux-focus-events" # fix focus events with tmux
git clone https://github.com/tmux-plugins/vim-tmux-focus-events.git $VB/tmux-focus-events
