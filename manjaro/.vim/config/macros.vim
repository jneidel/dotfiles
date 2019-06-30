"# vim macros
" emulate keypresses depending on language
" see: https://www.youtube.com/watch?v=Q4I_Ft-VLAg
"
" :help key-notation for key-notations (eg: <Space>)
"
" inoremap - activate in insert mode
" nnoremap - activate in normal mode

filetype plugin on

"## tools
" to jump to next <++> (placeholder),
" a custom goto command:
inoremap ,, <Esc>/<++><Enter>"_c4l

"## macros
"### HTML
autocmd FileType html,pug inoremap ,a <a href=""><++></a><Space><++><Esc>F"i
autocmd FileType html,pug inoremap ,b <b></b><Space><++><Esc>2T>i
autocmd FileType html,pug inoremap ,i <i></i><Space><++><Esc>2T>i
autocmd FileType html,pug inoremap ,c <code></code><Space><++><Esc>2T>i

"### Markdown
autocmd FileType md,markdown inoremap ,a [](<++>)<Esc>F]i
autocmd FileType md,markdown inoremap ,c ```<Enter>```<Enter><++><Esc>kO
autocmd FileType md,markdown inoremap ,l - [] <++><Esc>F[a

"### JavaScript
autocmd filetype js,ts,javascript,typescript inoremap ,f function (<++>) {<Enter><++><Enter>}<Esc>2kf<2ha
autocmd filetype js,ts,javascript,typescript inoremap ,o {<Enter>}<Esc>O
autocmd filetype js,ts,javascript,typescript inoremap ,i import  from "<++>";<++><Esc>Ffhi
autocmd filetype js,ts,javascript,typescript inoremap ,l console.log(  )<Esc>hi
autocmd filetype js,ts,javascript,typescript inoremap ,t test( "", () => {<Enter>const <Enter>const answer <Enter><Enter>const result <Enter>expect( result ).toBe( answer );<Enter>} );<Esc>02k2ela= <++><Esc>02k2ela= <++><Esc>0kela<++><Esc>0kf"a

"### Typescript
autocmd filetype ts,typescript inoremap ,c class<Space><Space>{<Enter>constructor( <++> )<Space>{<Enter><++><Enter>}<Enter>}<Esc>4kf{hi

"### Shell
autocmd filetype sh,bash,shell,zsh inoremap ,f function<Space><Space>{<Enter><++><Enter>}<Esc>02kf a
autocmd filetype sh,bash,shell,zsh inoremap ,o {<Enter>}<Esc>O

"### JSON
autocmd filetype json inoremap ,o {<Enter>}<Esc>O

"### CSS, SCSS
autocmd filetype css,scss,sass inoremap ,o {<Enter>}<Esc>O

