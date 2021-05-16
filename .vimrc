" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Insert Custom settings below!

" Depending on docs, fixes several bugs with insert mode and the delete key...
set nocompatible

" enable spell checing
set spelllang=en_us 

" Set tmp dirs
set undodir=~/.vim/tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" Set line numbers
:set number 
:set relativenumber

" Add syntax highlighting
syntax on

" Enable mouse clicking
set mouse=a

" Highlight matching brackets
set showmatch

" Autoindent
" If intended, new lines will also be intended
set autoindent

" Smartindent
" Automatically indents lines after opening a bracket in programming languages
set smartindent

" Backspace
set backspace=2

" tabstop
set tabstop=4

" smartabbing
" move cursor to next tab position instead of a length of tabstop away
set smarttab

" shiftwidth
" sets the standard indent
set shiftwidth=4
