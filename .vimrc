" Do not try to be VIM compatible
set nocompatible

" Color Settings
syntax enable " Enable Syntax Highlighting

"Encoding
set encoding=utf-8

"" colorscheme
" set termguicolors " Use Terminal GUI Colors
set term=screen-256color

" Spaces & Tabs
" Number of Visual spaces in a tab
let tabsize = 4
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set autoindent " Auto Indent New Lines
set smartindent " Enable smart indent
set smarttab " Enable Smart Tab

" UI Config
set number " Show Line Numbers
" set showcmd " Show Command Line in the bottom bar
" set cursorline " Hightlight the current line
set lazyredraw " Redraw only when required
set showmatch " Highlights matching [{()}]
set scrolloff=4 " Always show at least 4 line above/below the cursor

" Searching
set incsearch " Search the file as characters are entered
set hlsearch " Highlight all matches when searching
set ignorecase " Ignores case whensearching
set smartcase " Enable Smart Case Search
" Use ,nhs to stop highligh    ting matches
nnoremap ,nhs :nohlsearch<CR>

" Misc
set wildmenu " Autocomplete in Menu
" set mouse=a " Make Copy Pasting Easier (Won't let you paster in putty)

