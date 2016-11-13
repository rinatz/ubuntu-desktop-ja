" vi incompatible mode
set nocompatible

" encoding and newline characters
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix

if has('win32')
    set termencoding=cp932
else
    set termencoding=utf-8
endif

" don't create buckup file and undo file
set nobackup
set noundofile
set noswapfile

"
" View settings
"
" insert tab as four spaces
set tabstop=4
set shiftwidth=4
set noautoindent
set nosmartindent
set expandtab

" don't show short messages
set shortmess+=I

" don't wrap a long line
set nowrap

" show completion at the status bar
set wildmenu

" show invisible characters
set list
set listchars=tab:>>,trail:.

" show line numbers at the left side
set number

" show file encoding and file format at the status line
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" hilight at the cursor line
set cursorline

"
" Key actions
"
" delete indent and new line with backspace
set backspace=indent,eol,start

" move from beginning of line to end of upper line with left key
set whichwrap=b,s,<,>,[,]
