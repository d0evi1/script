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
" let &guioptions = substitute(&guioptions, 't', '', 'g')

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


"-----------------------------------------------
" http://nootn.com/blog/Tool/22/
"-----------------------------------------------
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

" 字体显示.
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

colorscheme desert

set tags=tags;
set tags+=~/.vim/sys.tags
set tags+=~/.vim/comm.tags

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

"-------------------------------------
" 字体设置. 
"--------------------------------------
set guifont=Monaco:h16

"---------------------------------------
" python 自动生成头模板. (2015.7.31)
"---------------------------------------
func SetPyTitle()
    call setline(1, "#!/usr/bin/python")
    call append(line("."), "# -*- coding: utf-8 -*-")
    call append(line(".")+1, "")
endfunc

autocmd BufNewFile *.py exec ":call SetPyTitle()"

"---------------------------------------
" shell 自动生成头模板. (2015.7.31)
"---------------------------------------
func SetShellTitle()
    call setline(1, "#!/bin/bash")
    call append(line("."), "")
    call append(line(".")+1, "#--------------------------------------------")
    call append(line(".")+2, "# History: junle, ".strftime("%Y/%m/%d").", create")
    call append(line(".")+3, "# desc: ")
    call append(line(".")+4, "#------------------------------------------")
    call append(line(".")+5, "")
    call append(line(".")+6, "function main()")
    call append(line(".")+7, "{")
    call append(line(".")+8, "	echo  \"hello world\"| awk '{print $0}'")
    call append(line(".")+9, "}")
    call append(line(".")+10, "")
    call append(line(".")+11, "main")
endfunc

autocmd BufNewFile *.sh exec ":call SetShellTitle()"



map <f6> :execute "let g:word = expand(\"<cword>\")"<Bar>execute "vimgrep /\\<" . g:word ."\\>/g **/*.[ch] "<Bar>execute "cc 1"<Bar>execute "cw"<CR>
map <f7> :cn<CR> 
map <f8> :cp<CR> 
map <f5> :make<CR>
map <f2> wm


"---------------------------------------
" add by jungle. [2014.9.12] 
"---------------------------------------
filetype plugin on

"---------------------------------------
" taglist.   by jungle 2014.9.14
"---------------------------------------
"let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的    
"let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Ctags_Cmd="/usr/local/Cellar/ctags/bin/ctags"    "将taglist与ctags关联


""let Tlist_Auto_Open=1
"let Tlist_Show_Menu=1
"let Tlist_Use_SingleClick=1


"-----------------------------------------------
" neocomplete by jungle. 2014.1.1
"-----------------------------------------------
"let g:neocomplcache_enable_at_startup = 1  "在系统启动的时候启动neo  
"let g:neocomplcache_enable_auto_select = 1 "示的时候默认选择地一个，如果你设置为0，每次输入都需要用上下键选择，你不妨修改试试效果就知道了  

"--------------------------------------
" taghighlight  jungle 2014.10.26
"--------------------------------------
let UpdateTypesFile=1


"----------------------------------------
" Vundle 2015.11.2
"----------------------------------------
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

"Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

"
Plugin 'vim-scripts/winmanager'

"nerdtree:
Bundle 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'

"tagbar
Plugin 'majutsushi/tagbar'

" youcompleteme
Plugin 'Valloric/YouCompleteMe'

" jedi
Plugin 'davidhalter/jedi-vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"--------------------------------------
" python.vim
"--------------------------------------
"set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
let python_highlight_all=1


"------------------------------------
" pathogen      jungle 2015.3.10
"------------------------------------
"call pathogen#infect()
"call pathogen#helptags()

"---------------------------------
" python-mode
"---------------------------------
"let g:pymode_lint_ignore = "E501,W0611,E265,E302,W391,E502,E128,E231,E303,E225,E266,E221,E251,E20,E162"


"----------------------------------
" NERDTree
"----------------------------------
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" 显示书签列表
let NERDTreeShowBookmarks=1

"let g:loaded_nerdtree_autoload = 1

"--------------------------------
" winmanager layout.
"--------------------------------
let g:NERDTree_title='[NERDTree]'  
let g:winManagerWindowLayout='NERDTree|Tagbar'  

function! NERDTree_Start() 
    exec 'q' 
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  

let g:AutoOpenWinManager=1



"------------------------------------------
" tagbar. add by 2016.12.24
"-----------------------------------------
let g:Tagbar_title = "Tagbar"
function! Tagbar_Start()
    exec 'TagbarOpen'
endfunction
 
function! Tagbar_IsValid()
    return 1
endfunction

let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/bin/ctags' 
let g:tagbar_vertical = 30
let g:tagbar_width = 30

let g:tagbar_autofocus=0

"-----------------------------------
" youcompleteme. add by 2016.12.25
"-----------------------------------
let mapleader = ","  " 这个leader就映射为逗号“，”
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   "按,jd 会跳转到定义
let g:ycm_confirm_extra_conf=0    "打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件

"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"输入第一个字符就开始补全  
let g:ycm_min_num_of_chars_for_completion=1  


