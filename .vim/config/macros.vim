"# vim macros
" execute keypresses for common clauses,
" grouped by filetypes
" see: https://www.youtube.com/watch?v=Q4I_Ft-VLAg
"
" :help key-notation for key-notations (eg: <Space>)
"
" imap - activate in insert mode
" nmap - activate in normal mode

filetype plugin on

"## tools
" to jump to next <++> (placeholder),
" a custom goto command:
inoremap ,, <Esc>/<++><Enter>"_c4l

"## macros
"### HTML
au filetype html,pug imap ,a <a href=""><++></a><Space><++><Esc>F"i
au filetype html,pug imap ,b <b></b><Space><++><Esc>2T>i
au filetype html,pug imap ,i <i></i><Space><++><Esc>2T>i
au filetype html,pug imap ,c <code></code><Space><++><Esc>2T>i
au filetype html imap ,o {<Enter>}<Esc>O

"### Markdown
au filetype md,markdown imap ,a [](<++>)<Esc>F]i
au filetype md,markdown imap ,c ```<Enter>```<Enter><++><Esc>kO
au filetype md,markdown imap ,j ```json<Enter>```<Enter><++><Esc>kO
au filetype md,markdown imap ,s ```sh<Enter>```<Enter><++><Esc>kO
au filetype md,markdown imap ,l - [] <++><Esc>F[a
au filetype md,markdown nmap ,d :r !date +"\#\#\# \%a \%d.\%m.\%y"<Enter>A<Enter>
au filetype md,markdown nmap ,j :r !date +"\%d.\%m.\%y"<Enter>A<Enter>
au filetype md,markdown imap ,i - [ ]<Space>

"### JavaScript/Typescript
au filetype js,ts,javascript,typescript,pug imap ,o {<Enter>}<Esc>O
au filetype js,ts,javascript,typescript imap ,f function (<++>) {<Enter><++><Esc>kf<2ha
au filetype js,ts,javascript,typescript imap ,a async function (<++>) {<Enter><++><Esc>kf<2ha
" au filetype js,ts,javascript,typescript imap ,a [  ]<Esc>hi
au filetype js,ts,javascript,typescript imap ,i import  from "<++>";<Esc>Ffhi
au filetype js,ts,javascript,typescript imap ,l console.log(  )<Esc>hi
au filetype js,ts,javascript,typescript imap ,t test( "", () => {<Enter>const <Enter>const answer <Enter><Enter>const result <Enter>expect( result ).toBe( answer );<Enter>} );<Esc>02k2ela= <++><Esc>02k2ela= <++><Esc>0kela<++><Esc>0kf"a

"#### Typescript exclusive
au filetype ts,typescript imap ,c class<Space><Space>{<Enter>constructor( <++> )<Space>{<Enter><++><Enter>}<Enter>}<Esc>4kf{hi

"### Shell
au filetype sh,bash,shell,zsh imap ,f ()<Space>{<Enter><++><Enter>}<Esc>2k0i
au filetype sh,bash,shell,zsh imap ,o {<Enter>}<Esc>O
au filetype sh,bash,shell,zsh imap ,i if [ "$" <++> ]; then<Enter><++><Enter>fi<Esc>2kf$a
au filetype sh,bash,shell,zsh imap ,c case $ in<Enter><++>) <++>;;<Enter><++>) <++>;;<Enter>*) <++>;;<Enter>esac<Esc>4k0f$a

"### JSON
au filetype json imap ,o {<Enter>}<Esc>O

"### CSS, SCSS
au filetype css,scss,sass imap ,o {<Enter>}<Esc>O

"### C, C++
au filetype c,cpp imap ,o {<Enter>}<Esc>O

"### Java
au filetype java imap ,o {<Enter>}<Esc>O
au filetype java imap ,i <Esc>ggIpublic class  {<Enter>public static void main( String[] args ) {<Enter><++><Enter>}<Enter>}<Esc>gg2ela
au filetype java imap ,p System.out.print(  );<Esc>2hi
au filetype java imap ,pl System.out.println(  );<Esc>2hi
au filetype java imap ,pf System.out.printf( , <++> );<Esc>F,i
au filetype java imap ,f for ( ; <++>; <++> ) {<Enter><++><Enter>}<Esc>2kf(la
au filetype java imap ,w while (  ) {<Enter><++><Enter>}<Esc>2kf(la
au filetype java imap ,t @Test<Enter>public void () {<Enter><++><Enter>}<Esc>02kf(i

"### LaTeX
au filetype tex imap ,o {}<Esc>i
au filetype tex imap ,be \begin{}<Enter><++><Enter>\end{<++>}<Esc>02kf{a
au filetype tex imap ,t % TODO:<Space>
au filetype tex imap ,l \begin{code}<Enter>\begin{shellcode}<Enter><Enter>\end{shellcode}<Enter>\captionof{listing}{<++>}<Enter>\medskip<Enter>\end{code}<Enter><Enter><++><Esc>06ki<Tab>

"#### sections
au filetype tex imap ,ch \chapter{}<Enter><Enter><++><Esc>02kf{a
au filetype tex imap ,s \section{}<Enter><Enter><++><Esc>02kf{a
au filetype tex imap ,ss \subsection{}<Enter><Enter><++><Esc>02kf{a
au filetype tex imap ,sss \subsubsection{}<Enter><Enter><++><Esc>02kf{a

"#### text style
au filetype tex imap ,b \textbf{} <++><Esc>2ba
au filetype tex imap ,it \textit{} <++><Esc>2ba
au filetype tex imap ,ce \begin{center}<Enter><Enter>\end{center}<Esc>0kA
au filetype tex imap ,ra \begin{flushright}<Enter><Enter>\end{flushright}<Esc>0kA

"#### whitespace
au filetype tex imap ,ms <Enter>\medskip<Enter>
au filetype tex imap ,sk <Enter>\smallskip<Enter>
au filetype tex imap ,bs <Enter>\bigskip<Enter>
au filetype tex imap ,np <Enter>\newpage<Enter>

"#### cite
au filetype tex imap ,c \cite{}<++><Esc>F{a
au filetype tex imap ,pc \parencite{}<++><Esc>F{a
au filetype tex imap ,cn % TODO: citation needed<Enter>

"#### images
au filetype tex imap ,f \begin{figure}<Enter>\centering<Enter>\includegraphics[scale=0.5]{.png}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Esc>3k0f{a
au filetype tex imap ,im \includegraphics[scale=0.5]{}<Enter><Esc>kf{a

"#### labels and references
au filetype tex imap ,la \label{chap:}<Enter><Enter><++><Esc>2k0f:a
au filetype tex imap ,rf Abbildung \ref{fig:} <++><Esc>F:a
au filetype tex imap ,rc Kapitel \ref{chap:} <++><Esc>F:a

"#### lists
au filetype tex imap ,ul \begin{itemize}<Enter>\item <Enter>\end{itemize}<Enter><++><Esc>2kA
au filetype tex imap ,ol \begin{enumerate}<Enter>\item <Enter>\end{enumerate}<Enter><++><Esc>2kA
au filetype tex imap ,i \item<Space>
au filetype tex imap ,ta \begin{table}[h!]<Enter>\begin{center}<Enter>\caption{<++>}<Enter>\label{tab:table1}<Enter>\begin{tabular}{<++>}<Enter><Enter>\hline<Enter><++>\\<Enter><++><Enter>\end{tabular}<Enter>\end{center}<Enter>\end{table}<Esc>06kA

"#### math
au filetype tex imap ,m \[  \]<Enter><Enter><++><Esc>02kf[la
au filetype tex imap ,mm \[<Enter><Enter>\]<Esc>0ka
au filetype tex imap ,br \frac{}{<++>} <++><Esc>2ba
au filetype tex imap ,_ _{}<++><Esc>ba
au filetype tex imap ,^ ^{}<++><Esc>bla
au filetype tex imap ,aa \begin{align*}<Enter><Enter>\end{align*}<Esc>kA
au filetype tex imap ,ae \begin{eqnarray*}<Enter><Enter>\end{eqnarray*}<Esc>kA
au filetype tex imap ,d \cdot<Space>
au filetype tex imap ,< \textless
au filetype tex imap ,> \textgreater

"#### beamer
au filetype tex imap ,fr \begin{frame}\end{frame}<Enter><Enter><++><Esc><<2k0f}a<Enter><Esc>O
au filetype tex imap ,ft \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter>\end{frame}<Enter><Enter><++><Esc>5kf{a

"### vim borked
au filetype vim imap ,o {\<Enter>}<Esc>i

"### scala
au filetype scala imap ,o {<Enter>}<Esc>O

"### python
au filetype python imap ,l print(  )<Esc>hi

"### remind (.rem)
au filetype remind imap ,r SPECIAL COLOR 225 0 0<Space>
au filetype remind imap ,g SPECIAL COLOR 0 225 0<Space>
au filetype remind imap ,b SPECIAL COLOR 0 0 225<Space>
