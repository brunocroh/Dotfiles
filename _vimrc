syntax enable

set guifont=Space_Mono_for_Powerline:h9:cANSI:qDRAFT
let g:molokai_original = 1
let g:NERDTreeDirArrows=0
set encoding=utf-8
set number
set relativenumber
set incsearch
set hlsearch

set nowrap
set list lcs=tab:\|\ 

set backspace=2
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

let g:airline_solarized_bg='molokai'

let g:syntastic_javascript_checkers=['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

au BufReadPost *.ftl set syntax=html

call plug#begin('~/.vim/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'arcticicestudio/nord-vim'
  Plug 'yggdroot/indentline'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-surround'
  Plug 'leafgarland/typescript-vim'
  Plug 'dahu/vim-rng'
  Plug 'lucasteles/swtc.vim'
  Plug 'vim-scripts/HJKL'
  Plug 'tomasr/molokai'
  Plug 'mattn/emmet-vim'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/matchit.zip'
  Plug 'jiangmiao/auto-pairs'
  Plug 'dracula/vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/tpope-vim-abolish'
call plug#end()

" Configuração do TAB
set tabstop=2
set shiftwidth=2
set expandtab

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" enable line numbers
let NERDTreeShowLineNumbers=1

let g:airline_powerline_fonts = 1
color dracula
