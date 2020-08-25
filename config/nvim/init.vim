" Do not try to be VIM compatible
set nocompatible

" Color Settings
syntax enable " Enable Syntax Highlighting

"Encoding
set encoding=utf-8

" Turn of filetype detection and indentation on
filetype plugin indent on

"" colorscheme
" set termguicolors " Use Terminal GUI Colors
" set term=screen-256color

" Dark Background colours
set background=dark

" Spaces & Tabs
" Number of Visual spaces in a tab
" let tabsize = 4
" execute "set tabstop=".tabsize
" execute "set shiftwidth=".tabsize
" execute "set softtabstop=".tabsize
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


" Plugins

call plug#begin()

" File explorer
Plug 'scrooloose/nerdtree'

" Fuzzy Matching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Matching things
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

call plug#end()

" Plugin Settings

" vim-closetag
" https://github.com/alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" NerdTree
" https://github.com/preservim/nerdtree
" Always open NerdTree
autocmd vimenter * NERDTree
" Open NerdTree on Ctrl-n
map <C-n> :NERDTreeToggle<CR>
" Close vim if only NerdTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" coc.nvim
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
