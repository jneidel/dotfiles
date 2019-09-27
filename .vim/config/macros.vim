"# vim macros
" execute keypresses for common clauses,
" grouped by filetypes
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
au filetype html,pug inoremap ,a <a href=""><++></a><Space><++><Esc>F"i
au filetype html,pug inoremap ,b <b></b><Space><++><Esc>2T>i
au filetype html,pug inoremap ,i <i></i><Space><++><Esc>2T>i
au filetype html,pug inoremap ,c <code></code><Space><++><Esc>2T>i

"### Markdown
au filetype md,markdown inoremap ,a [](<++>)<Esc>F]i
au filetype md,markdown inoremap ,c ```<Enter>```<Enter><++><Esc>kO
au filetype md,markdown inoremap ,l - [] <++><Esc>F[a
au filetype md,markdown nnoremap ,d :r !date +"\%d.\%m.\%y"<Enter>A<Enter>

"### JavaScript/Typescript
au filetype js,ts,javascript,typescript inoremap ,f function (<++>) {<Enter><++><Enter>}<Esc>2kf<2ha
au filetype js,ts,javascript,typescript inoremap ,o {<Enter>}<Esc>O
au filetype js,ts,javascript,typescript inoremap ,a [  ]<Esc>hi
au filetype js,ts,javascript,typescript inoremap ,i import  from "<++>";<++><Esc>Ffhi
au filetype js,ts,javascript,typescript inoremap ,l console.log(  )<Esc>hi
au filetype js,ts,javascript,typescript inoremap ,t test( "", () => {<Enter>const <Enter>const answer <Enter><Enter>const result <Enter>expect( result ).toBe( answer );<Enter>} );<Esc>02k2ela= <++><Esc>02k2ela= <++><Esc>0kela<++><Esc>0kf"a

"#### Typescript exclusive
au filetype ts,typescript inoremap ,c class<Space><Space>{<Enter>constructor( <++> )<Space>{<Enter><++><Enter>}<Enter>}<Esc>4kf{hi

"### Shell
au filetype sh,bash,shell,zsh inoremap ,f function<Space><Space>{<Enter><++><Enter>}<Esc>02kf a
au filetype sh,bash,shell,zsh inoremap ,o {<Enter>}<Esc>O

"### JSON
au filetype json inoremap ,o {<Enter>}<Esc>O

"### CSS, SCSS
au filetype css,scss,sass inoremap ,o {<Enter>}<Esc>O

