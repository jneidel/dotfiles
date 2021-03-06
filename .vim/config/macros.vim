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
au filetype html inoremap ,o {<Enter>}<Esc>O

"### Markdown
au filetype md,markdown inoremap ,a [](<++>)<Esc>F]i
au filetype md,markdown inoremap ,c ```<Enter>```<Enter><++><Esc>kO
au filetype md,markdown inoremap ,j ```json<Enter>```<Enter><++><Esc>kO
au filetype md,markdown inoremap ,s ```sh<Enter>```<Enter><++><Esc>kO
au filetype md,markdown inoremap ,l - [] <++><Esc>F[a
au filetype md,markdown nnoremap ,d :r !date +"\%d.\%m.\%y"<Enter>A<Enter>
au filetype md,markdown inoremap ,i - [ ]<Space>

"### JavaScript/Typescript
au filetype js,ts,javascript,typescript,pug inoremap ,o {<Enter>}<Esc>O
au filetype js,ts,javascript,typescript inoremap ,f function (<++>) {<Enter><++><Enter>}<Esc>2kf<2ha
au filetype js,ts,javascript,typescript inoremap ,s async function (<++>) {<Enter><++><Enter>}<Esc>2kf<2ha
au filetype js,ts,javascript,typescript inoremap ,a [  ]<Esc>hi
au filetype js,ts,javascript,typescript inoremap ,i import  from "<++>";<Esc>Ffhi
au filetype js,ts,javascript,typescript inoremap ,l console.log(  )<Esc>hi
au filetype js,ts,javascript,typescript inoremap ,t test( "", () => {<Enter>const <Enter>const answer <Enter><Enter>const result <Enter>expect( result ).toBe( answer );<Enter>} );<Esc>02k2ela= <++><Esc>02k2ela= <++><Esc>0kela<++><Esc>0kf"a

"#### Typescript exclusive
au filetype ts,typescript inoremap ,c class<Space><Space>{<Enter>constructor( <++> )<Space>{<Enter><++><Enter>}<Enter>}<Esc>4kf{hi

"### Shell
au filetype sh,bash,shell,zsh inoremap ,f ()<Space>{<Enter><++><Enter>}<Esc>2k0i
au filetype sh,bash,shell,zsh inoremap ,o {<Enter>}<Esc>O
au filetype sh,bash,shell,zsh inoremap ,i if [ "$" <++> ]; then<Enter><++><Enter>fi<Esc>2kf$a
au filetype sh,bash,shell,zsh inoremap ,c case $ in<Enter><++>) <++>;;<Enter><++>) <++>;;<Enter>*) <++>;;<Enter>esac<Esc>4k0f$a

"### JSON
au filetype json inoremap ,o {<Enter>}<Esc>O

"### CSS, SCSS
au filetype css,scss,sass inoremap ,o {<Enter>}<Esc>O

"### C, C++
au filetype c,cpp inoremap ,o {<Enter>}<Esc>O

"### Java
au filetype java inoremap ,o {<Enter>}<Esc>O
au filetype java inoremap ,i <Esc>ggIpublic class  {<Enter>public static void main( String[] args ) {<Enter><++><Enter>}<Enter>}<Esc>gg2ela
au filetype java inoremap ,p System.out.print(  );<Esc>2hi
au filetype java inoremap ,pl System.out.println(  );<Esc>2hi
au filetype java inoremap ,pf System.out.printf( , <++> );<Esc>F,i
au filetype java inoremap ,f for ( ; <++>; <++> ) {<Enter><++><Enter>}<Esc>2kf(la
au filetype java inoremap ,w while (  ) {<Enter><++><Enter>}<Esc>2kf(la
au filetype java inoremap ,t @Test<Enter>public void () {<Enter><++><Enter>}<Esc>02kf(i

"### LaTeX
au filetype tex inoremap ,o {}<Esc>i
au filetype tex inoremap ,be \begin{}<Enter><++><Enter>\end{<++>}<Esc>02kf{a
au filetype tex inoremap ,s \section{}<Enter><Enter><++><Esc>02kf{a
au filetype tex inoremap ,ss \subsection{}<Enter><Enter><++><Esc>02kf{a
au filetype tex inoremap ,sss \subsubsection{}<Enter><Enter><++><Esc>02kf{a

"#### text style
au filetype tex inoremap ,b \textbf{} <++><Esc>2ba
au filetype tex inoremap ,it \textit{} <++><Esc>2ba
au filetype tex inoremap ,c \begin{center}<Enter><Enter>\end{center}<Esc>0kA
au filetype tex inoremap ,sk <Enter>\medskip<Enter>

"#### lists
au filetype tex inoremap ,ul \begin{itemize}<Enter>\item <Enter>\end{itemize}<Enter><++><Esc>2kA
au filetype tex inoremap ,ol \begin{enumerate}<Enter>\item <Enter>\end{enumerate}<Enter><++><Esc>2kA
au filetype tex inoremap ,i \item<Space>
au filetype tex inoremap ,t \begin{table}[h!]<Enter>\begin{center}<Enter>\caption{<++>}<Enter>\label{tab:table1}<Enter>\begin{tabular}{<++>}<Enter><Enter>\hline<Enter><++>\\<Enter><++><Enter>\end{tabular}<Enter>\end{center}<Enter>\end{table}<Esc>06kA

"#### math
au filetype tex inoremap ,m \[  \]<Enter><Enter><++><Esc>02kf[la
au filetype tex inoremap ,mm \[<Enter><Enter>\]<Esc>0ka
au filetype tex inoremap ,br \frac{}{<++>} <++><Esc>2ba
au filetype tex inoremap ,_ _{}<++><Esc>ba
au filetype tex inoremap ,^ ^{}<++><Esc>bla
au filetype tex inoremap ,aa \begin{align*}<Enter><Enter>\end{align*}<Esc>kA
au filetype tex inoremap ,ae \begin{eqnarray*}<Enter><Enter>\end{eqnarray*}<Esc>kA
au filetype tex inoremap ,d \cdot<Space>

"#### beamer
au filetype tex inoremap ,fr \begin{frame}\end{frame}<Enter><Enter><++><Esc><<2k0f}a<Enter><Esc>O
au filetype tex inoremap ,ft \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter>\end{frame}<Enter><Enter><++><Esc>5kf{a

"#### misc
au filetype tex inoremap ,< \textless
au filetype tex inoremap ,> \textgreater
au filetype tex inoremap ,im \includegraphics[scale=0.5]{}<Enter><Esc>kf{a

"### vim borked
au filetype vim inoremap ,o {\<Enter>}<Esc>i

