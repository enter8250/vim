set encoding=utf-8
language messages en
set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
let $LANG = 'en'

let mapleader=","
"""""""""""""""""""""""""""""""""""""""""""""""""
autocmd GUIEnter * winpos 0 0 | set lines=9999 columns=99999
"autocmd BufWritePre,FileWritePre *.v   ks|call LastModified()|'s
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window = 1
let g:winManagerWindowLayout='FileExplorer,'


"""""""""""""""""""""""""""""""""""""""""""""""""
"you can always check the proper syntax for the font using :set guifont?
if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h13:cANSI:qDRAFT
else
    set guifont=Mono\ 12
endif
colorscheme CandyPaper
set wildmenu "auto complete command line"
set mouse=a
set autochdir
set guioptions-=T "not include toolbar"
set guioptions+=a "select auto copy
filetype on
filetype plugin on
filetype indent on
set autoindent " automatically set indent of new line
set smartindent
set fileencodings=utf-8,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom
set ambiwidth=double "chinese character"
set modifiable
syntax on
set   showmatch
set   nu "show line number

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
 else
    return a:char
 endif
endf


syntax on
set hlsearch
set incsearch  " set incremental search, like modern browsers
set showcmd

:inoremap   <C-S> <ESC>:w<CR>
noremap         <C-S> :w<CR>
"cut
"vnoremap <C-X> "+x
""copy
"vnoremap <C-C> "+y
""paste
"map <C-Q>		"+gP
"cmap <C-Q>		<C-R>+
""save
"noremap <C-S>		:update<CR>
"vnoremap <C-S>		<C-C>:update<CR>
"inoremap <C-S>		<C-O>:update<CR>
""undo
"noremap <C-Z> u
"inoremap <C-Z> <C-O>u
" CTRL-A is Select all
noremap <C-A> ggVG
"noremap <C-A> gggH<C-O>G
"inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
"cnoremap <C-A> <C-C>gggH<C-O>G
"onoremap <C-A> <C-C>gggH<C-O>G
"snoremap <C-A> <C-C>gggH<C-O>G
"xnoremap <C-A> <C-C>ggVG
"remap C-A inc number
noremap <A-x> <C-A>
"new tab
":inoremap    <F3>  <ESC>:browse tabnew<CR>
"noremap          <F3>  :browse tabnew<CR>
":inoremap    <F3>  <ESC>:TlistOpen<CR>
"map          <F3>  :TlistOpen<CR>
"move window to left/right
:inoremap    <A-,>  <ESC><C-W>H
noremap          <A-,>  <C-W>H
:inoremap    <A-.>  <ESC><C-W>L
noremap          <A-.>  <C-W>L

"close tab
":inoremap   <F4>  <ESC>:wq<CR>
"map         <F4>  :wq<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
"nmap <leader>bq :bp <BAR> bd #<CR>
:inoremap    <C-del>  <ESC>:bp <BAR> bd #<CR>
noremap          <C-del>  :bp <BAR> bd #<CR>
noremap         <C-PageUp> :bp<CR>
noremap         <C-PageDown> :bn<CR>
inoremap         <C-PageUp>  <ESC>:bp<CR>
inoremap         <C-PageDown>  <ESC>:bn<CR>
inoremap         <C-W>  <ESC>llbcw



"taglist
"let Tlist_File_Fold_Auto_Close=1
"set updatetime=1000
:inoremap  <A-0> <ESC>:TagbarToggle<cr> 
noremap        <A-0> :TagbarToggle<CR>
" ?F8 ?蛾???亙?
"inoremap <F8> <C-x><C-o>
":inoremap   <F8> <ESC>:WMToggle<cr>  
noremap       <A-9>  :Lexplore<cr>  
:inoremap <A-9> <esc>:Lexplore<cr>
"clear search highlight
:inoremap  <F9>  <ESC>:set hlsearch!<cr>
noremap <F9>   :set hlsearch!<cr>

":inoremap  <F8>  <ESC>:NERDTreeToggle<cr>
"map <F8>   :NERDTreeToggle<cr>
":inoremap  <F3>  <ESC>:WMToggle<cr>
"map <F3>   :WMToggle<cr>

"Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
set statusline+=\ %{VimBuddy()} " vim buddy
endif
set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

"" set status line
"set laststatus=2
"" enable powerline-fonts
"let g:airline_powerline_fonts = 1

" Line highlight 閮剜迨?舀虜璅銵?璅酉憿
set cursorline

"set foldenable
set foldlevel=3
"set foldmethod=indent
"set foldmethod=marker 
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


set foldmethod=syntax
"set foldcolumn=3     " the number of columns to use for folding display at the left
"set foldlevelstart=99  "initial no fold close
set nofoldenable "disable fold
 


"noremap <2-LeftMouse> *#ve<ESC>
"highlight with double click
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr> :let @*=''.escape(expand('<cword>'), '\').''<cr>
"noremap <F10> :set syntax=other<CR>

set ignorecase
"set autoread " detect when a file is changed
set nocompatible " not compatible with vi
set smartcase " case-sensitive if expresson contains a capital letter
set nolazyredraw " don't redraw while executing macros


" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" faster redrawing
set ttyfast
set clipboard=unnamed
"set clipboard^=unnamedplus
"set backupdir=~/tmp,/tmp
set directory=c:/tmp

"set titlestring=%f\ \-\ %{getcwd()} 
set titlestring=%t\ \-\ (%{resolve(expand(\"%:p\"))})

" Tab control
"set noexpandtab " tabs ftw
set expandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

"open file in new tab
"au BufAdd,BufNewFile * nested tab sball
set ff=unix "file format

" Shortcut to rapidly toggle `set list`
noremap <leader>l :set list!<CR>
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"set vim window size
"set lines=40 columns=200


" set RUNTIMEPATH
"set rtp+=~enter/.gvim




" Map Setting
"nmap j i<ENTER><ESC>
""nmap Y i.<ESC><RIGHT>veyea()<ESC>P<DOWN>b
"nmap Y i.<ESC><RIGHT>veyea()<ESC>PW
"nmap M dwywPa my_<ESC><DOWN><END>b
"nmap <TAB> a<TAB><ESC>
"
"map <F1> i#! /usr/bin/perl -w<ENTER><ENTER>
"map! !p %s/parameter NONE;\|#(NONE)//g<ENTER>
"
"imap ,b begin<ENTER><TAB><ENTER>end<UP><END>
"imap ,m module (<ENTER>);<ENTER>endmodule<UP><UP><END><LEFT>
"
"imap ,c case ()<ENTER><TAB><ENTER>endcase<UP><UP><END><LEFT>
"imap ,i if <ENTER>begin<ENTER><TAB><ENTER>end<UP><UP><UP>()<LEFT>
"imap ,e else<ENTER>begin<ENTER><TAB><ENTER>end<UP>
"imap ,ie ,i<DOWN><DOWN><DOWN><ENTER>,e<UP><UP><UP><UP><UP><UP><END><LEFT>
"
"imap ,@s always@(posedge clk or negedge rst_n)<ENTER><LEFT>begin<ENTER><TAB><ENTER>end<UP><END>,ie!rst_n<DOWN><DOWN><END>
"imap ,@c always@(*)<ENTER><LEFT>begin<ENTER><TAB><ENTER>end<UP><END>
"imap ,k always<ENTER><TAB>#(PERIOD/2) clk=~clk;<ENTER>
"imap ,p #(PERIOD);<ENTER>
"
"imap ,t `timescale 1ns/1ps<ENTER><ENTER>
"imap ,` `include ""<LEFT>


"if $REMOTEHOST == "derek_wu.amc.com"
"        source ~enter/.gvimrc
"endif
"if $REMOTEHOST == "192.9.81.143" 
"        source ~enter/.gvimrc
"endif
"
set hidden "(Saves all open buffers in the background, instead of closing them and re-opening on demand)
set confirm "(Demands confirmation before closing unsaved buffers)
" backspace and cursor keys wrap to previous/next line fix backspace in insert mode
set backspace=indent,eol,start "whichwrap+=<,>,[,]
"set syntax=tcl

"search & replace in current word
vnoremap <S-F7> :sno#\%V<c-r><c-w>#<c-r><c-w>#gI<left><left><left>
vnoremap <F7> :sno#\%V\<<c-r><c-w>\>#<c-r><c-w>#gI<left><left><left>
noremap <S-F8> :%sno#<c-r><c-w>#<c-r><c-w>#gI<left><left><left>
noremap <F8> :%sno#\<<c-r><c-w>\>#<c-r><c-w>#gI<left><left><left>


"Use it like this to list all the lines containing the whole word bar:
":g/\<bar\>
":s/\%Vus/az/gcI  "replace in selected text, c for confirm, I for case sensitive
":s/foo/bar/g	Change each 'foo' to 'bar' in the current line.
":%s/foo/bar/g	Change each 'foo' to 'bar' in all the lines.
":'<,'>s/foo/bar/g	When compiled with +visual, change each 'foo' to 'bar' for all lines within a visual
":'<,'>s/\%Vfoo/bar/g "substitude visual block  \%V atom

" Method 1 (for Xwindows and mswindows), this map is different from the one shown in vim documentation:
"noremap <LeftRelease> "+y<LeftRelease>

"noremap <S-HOME> v^
"noremap <C-S-HOME> vgg
"noremap <S-END> v$
"noremap <C-S-END> vG
"inoremap <S-HOME> <esc>v^
"inoremap <S-END> <ESC><RIGHT>v$

noremap <F12> :Tabularize /




"====restore your cursor position in a file over several editing sessions
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" Easy Vim Mapping like others editors {{{
"easy help current word under cursor
map <F1> <ESC>:exec "help ".expand("<cword>")<CR>

"Shift-Home, Shift-End
nnoremap <silent><S-Home> <Esc>v^
nnoremap <silent><S-End> <Esc>v$
inoremap <silent><S-Home> <Esc>v^
inoremap <silent><S-End> <Right><Esc>v$

"Ctrl-Shift-Home, Ctrl-Shift-End
nnoremap <silent><C-S-Home> <Esc>v^gg
nnoremap <silent><C-S-End> <Esc>v$G$
inoremap <silent><C-S-Home> <Esc>v^gg
inoremap <silent><C-S-End> <Right><Esc>v$G$

"Ctrl-Shift-Left, Ctrl-Shift-Right
nnoremap <silent><C-S-Left> <Esc>vb
nnoremap <silent><C-S-Right> <Esc>vw
inoremap <silent><C-S-Left> <Esc>vb
inoremap <silent><C-S-Right> <Right><Esc>vw

"Shift-Up, Shift-Down
nnoremap <silent><S-Up> <Esc>vk
nnoremap <silent><S-Down> <Esc>vj
vnoremap <silent><S-Up> k
vnoremap <silent><S-Down> j
inoremap <silent><S-Up> <Esc>vk
inoremap <silent><S-Down> <Right><Esc>vj

"Change to Normal mode
vnoremap <silent><Up> <Esc>k
vnoremap <silent><Down> <Esc>j

"Sift-left, Shift-Right
nnoremap <silent><S-Left> vh
nnoremap <silent><S-Right> vl
vnoremap <silent><S-Left> h
vnoremap <silent><S-Right> l
inoremap <silent><S-Left> <Esc>vh
inoremap <silent><S-Right> <Right><Esc>vl

"in Insert mode Left goto last initial Visual selection and Change to Insert mode
vnoremap <silent><Left> <Esc>`<i
"in Insert mode Right goto last final Visual selection and Change to Insert mode
vnoremap <silent><Right> <Esc>`>a

" Backspace in Visual mode deletes selection
vnoremap <silent><BS> di
" Backspace in Normal mode goto back word
nnoremap <silent><BS> b
" Ctrl-Backspace erase a word
nnoremap <silent><C-BS> diw
"Tab in Normal mode goto next word
nnoremap <silent><Tab> w
" Del switch to Insert mode
"nnoremap <silent><C-Del> <Del>diW
" Del switch to Insert mode
vnoremap <silent><Del> <Del>i




"CTRL-S is Save file
"nmap <C-s> :update<cr>
"if has('gui_running')
"  "CTRL-O is Open file
"  nmap <C-o> :browse confirm tabnew<cr>
"  "CTRL-H is Replace
"  nmap <C-h> :promptrepl <c-r><c-w><cr>
"else
"  "CTRL-O is Open file
"  nmap <C-o> :tabnew %%
"  "CTRL-H is Replace
"  nmap <C-h> :%s/<C-r><C-w>/
"endif
"CTRL-F is Find command
nmap <C-F> /<C-r><C-w>
vmap <C-F> /<C-r><C-w>


"delete duplicate lines
nmap <leader>d :v/./,/./-1join <cr>

"CTRL-ENTER is insert line after
"nmap <c-cr> o<esc>
"CTRL-ENTER is insert line before
"nmap <c-s-cr> O<esc>



" Tab completion {{{
"for file completion
"imap <C-f> <C-x><C-f>
""for line completion
"imap <C-l> <C-x><C-l>
""for thesaurus file
"imap <C-t> <C-x><C-t>
""for tag completion
""imap <C-]> <C-x><C-]>
""current file all words
"imap <C-u> <C-x><C-u>
""macro completion
"imap <C-d> <C-x><C-d>
""for words in current file
"imap <C-i> <C-x><C-i>
"}}}


"Open file manager {{{
"http://vim.wikia.com/wiki/Open_Windows_Explorer_showing_directory_of_current_buffer
nmap <leader>e :!start explorer "%:p:h"<CR>
"}}}

"center search {{{
"http://vim.wikia.com/wiki/VimTip528
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap { {zz
nmap } }zz
nmap G Gzz
" }}}


" General {{{
"Go to last edit location with ,.
nmap <leader>. '.

" Type <leader>hl to toggle highlighting on/off, and show current value.
map <leader>h :set hlsearch! hlsearch?<CR>

" Make shift-insert work like in Xterm
"map <S-Insert> <MiddleMouse>
"map! <S-Insert> <MiddleMouse>


" Edit the vimrc file
autocmd FileType vim nmap <silent><leader>ed :new $MYVIMRC<CR>
"autocmd FileType vim nmap <F5> :source $MYVIMRC<CR>
"
"
" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
"imap jj <Esc>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Sudo to write
"cmap w!! w !sudo tee % >/dev/null

" Folding
"nmap <Space> za
"vmap <Space> za

" Reselect text that was just pasted with ,p
nmap <leader>v V`]

" Omnicompletion
imap <c-space> <c-x><c-o>

"It is much more efficient having Q save and quit the current buffer
"nnoremap <silent> Q ZZ

" Key bindings for adjusting the tab/shift width.
nnoremap <leader>w2 :setlocal tabstop=2<CR>:setlocal shiftwidth=2<CR>
nnoremap <leader>w4 :setlocal tabstop=4<CR>:setlocal shiftwidth=4<CR>
nnoremap <leader>w8 :setlocal tabstop=8<CR>:setlocal shiftwidth=8<CR>
" }}}

"" If this variable is set, augroup is defined, and start highlighting.
let g:hl_matchit_enable_on_vim_startup = 1

command! -nargs=* Wrap set wrap linebreak nolist




let g:SuperTabDefaultCompletionType = 'context'

let g:verilog_syntax_fold_lst = "all"


"delete trailing space
"noremap <F10> :%s/\s\+$//e<cr>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F10> :call <SID>StripTrailingWhitespaces()<CR>

"indent then re visual select
vmap <A-,> <gv
vmap <A-.> >gv


execute pathogen#infect()

let g:SuperTabDefaultCompletionType = 'context'

"" If this variable is set, augroup is defined, and start highlighting.
let g:hl_matchit_enable_on_vim_startup = 1

autocmd BufNewFile,BufRead *.s  set filetype=andes
autocmd BufNewFile,BufRead * if &syntax == '' | set filetype=other | endif
autocmd BufNewFile,BufRead *.sdc,*.synopsys*,*.setup set filetype=sdc
autocmd BufNewFile,BufRead *.cshrc*  set filetype=tcsh
autocmd BufNewFile,BufRead *.pat  set filetype=verilog
autocmd BufNewFile,BufRead *.sp*,*.l  set filetype=spice
autocmd BufNewFile,BufRead finesim.cfg  set filetype=spice
autocmd BufNewFile,BufRead Make*  set filetype=make
autocmd BufNewFile,BufRead *.rpt set filetype=other
autocmd BufNewFile,BufRead *.vg  set filetype=verilog
autocmd BufNewFile,BufRead *.c  set filetype=verilog_systemverilog

noremap <s-space> :CtrlPBuffer<cr>
noremap <c-space> :CtrlP<cr>
noremap <space> :CtrlPMRU<cr>

nnoremap <leader>2 :@"<CR>

"place all reg to line 30
nnoremap <c-g> :g%^reg\s*%m30<cr>

let mapleader=","

set tags=./tags,tags,~/.vim/tags/UVM

" MacOSX/Linux ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.nfs*,*/INCA_lib/*,*/verdiLog/*,*/.cache/* 
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = 'INCA_libs\|nWaveLog\|verdiLog\|simv.*\|csrc\|adpLog\|.*cache.*\|.*lib++\|.*fsdb'


" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'


"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


noremap <C-h> :call WinMove('h')<cr>
noremap <C-j> :call WinMove('j')<cr>
noremap <C-k> :call WinMove('k')<cr>
noremap <C-l> :call WinMove('l')<cr>

set nosol "make startofline off, the cursor is kept in the same column

"delete /*auto...*/
noremap <S-F4> :%s#\/\*auto.*\/##g<cr>

" :arg *.cpp
" :argadd *.h
" :arg "list all agrlist
" :argdo %s/pattern/replace/ge |update
" :bufdo %s/pattern/replace/ge |update

"copy file path to clipboard
noremap       <A-3>  :let @+=expand('%:p')<cr>  

noremap <leader>c <Esc>i#!/bin/csh -f<Esc>

"toggle toolbar
nnoremap <C-S-T> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>

"transpose 1 row input or output with , to each row with ;
noremap <c-,> ma^"zyw:s#,#;\r#g<cr>:'a+1,.s#^#\=@z#g<cr>
"set visual block select
set virtualedit=block

"format with par width 50, "gqip" for short
set formatprg=par\ -w50

"
"let g:netrw_fastbrowse    = 2
let g:netrw_altv = 1
let g:netrw_keepdir       = 0
"let g:netrw_retmap        = 1
"let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
"let g:netrw_liststyle = 3 "tree style (have bug)
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

"set termwinkey=<C-L>
" command abbrev to redefine h
cabbrev h vert h
cabbrev t vert terminal
cabbrev n vert new
"terminal mode map esc back to normal mode
tnoremap <Esc> <C-W>N
tnoremap <C-V> <C-W>""
tnoremap <C-C> <C-W><C-C>
noremap <C-C> <C-W>c

"""""""""""""""""""""""""""
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    map <buffer> <left> -
    map <buffer> <right> <cr>
endfunction
"""""""""""""""""""""""""""
au TerminalOpen * if &buftype == 'terminal' | set ft=other | endif

" Vertical Split Buffer Function
function VerticalSplitBuffer(buffer)
    execute "vert belowright sb" a:buffer 
endfunction
" Vertical Split Buffer Mapping
command -nargs=1 Vbuffer call VerticalSplitBuffer(<f-args>)

if has('nvim')
    tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    set inccommand=nosplit
endif

"To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

inoremap <A-=> <=

"delete selected empty lines
vnoremap <space> :g/^\s*$/d<cr>gv=

"edit windows registry
"edit ++enc=utf-16le 


"source current file
"so % or so%

function! AutoVA()
    :norm a/*autoarg*/
    :call AutoArg()
    :%sno#/*autoarg*/##g
endfunction
function! AutoVD()
    :norm a/*autodef*/
    :call AutoDef()
    :%sno#/*autodef*/##g
endfunction
function! AutoVI()
    :norm a/*autoinst*/
    :call AutoInst(0)
    :%sno#/*autoinst*/##g
endfunction

noremap  <C-I>  :call AutoVI()<cr>
