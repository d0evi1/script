" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
endif
set history=1024	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" http://nootn.com/blog/Tool/22/
set number
set scrolloff=10
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
set autochdir
set ignorecase
set smartcase
set nowrapscan
set incsearch
set hlsearch
set noerrorbells
set novisualbell
set t_vb=
set smartindent
set cinoptions=:0
set cmdheight=1
set laststatus=2
set showmatch
set display=lastline
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

set nobomb

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

colorscheme desert

set tags=tags;
set tags+=~/.vim/sys.tags
set tags+=~/.vim/comm.tags

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

set path+=/usr/local/commonlib/baselib
set path+=/usr/include

filetype plugin indent on

"autocmd BufNewFile *.c 0r ~/.vim/template/stdhead.ch
"autocmd BufNewFile *.h 0r ~/.vim/template/stdhead.ch

func SetCTitle()
    call setline(1, "/*")
    call append(line("."), " * Description: ")
    call append(line(".")+1, " *     History: junle, ".strftime("%Y/%m/%d").", create")
    call append(line(".")+2, " */")
    call append(line(".")+3, "")
endfunc

autocmd BufNewFile *.[ch] exec ":call SetCTitle()"

func SetPyTitle()
    call setline(1, "#!/usr/bin/python")
    call append(line("."), "# -*- coding: utf-8 -*-")
    call append(line(".")+1, "")
endfunc

autocmd BufNewFile *.py exec ":call SetPyTitle()"

map <f6> :execute "let g:word = expand(\"<cword>\")"<Bar>execute "vimgrep /\\<" . g:word ."\\>/g **/*.[ch] "<Bar>execute "cc 1"<Bar>execute "cw"<CR>
map <f7> :cn<CR> 
map <f8> :cp<CR> 
map <f1> :Tlist<CR>
map <f5> :make<CR>
map <f2> wm


"---------------------------------------
" add by jungle. [2014.9.12] 
"---------------------------------------
filetype plugin on

"---------------------------------------
" taglist.   by jungle 2014.9.14
"---------------------------------------
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags"    "将taglist与ctags关联 
