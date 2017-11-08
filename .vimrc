syntax on

let g:NERDTreeDirArrows=0

set number
set relativenumber

set incsearch
set hlsearch

set nowrap
setglobal fileencoding=utf-8

autocmd vimenter * NERDTree

set list lcs=tab:\|\ 
let g:airline_solarized_bg='molokai'

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'scrooloose/syntastic'
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/matchit.zip'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kien/ctrlp.vim'

    Plug 'thaerkh/vim-workspace'

    Plug 'Yggdroot/indentLine'
    Plug 'pangloss/vim-javascript'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'jelera/vim-javascript-syntax'
    Plug 'leafgarland/typescript-vim'
    Plug 'Valloric/YouCompleteMe'
    Plug 'Quramy/tsuquyomi'
    Plug 'ekalinin/dockerfile.vim'

    Plug 'ervandew/supertab'
    Plug 'mattn/emmet-vim'

    Plug 'tpope/vim-fugitive'

    Plug 'arcticicestudio/nord-vim'
    Plug 'tomasr/molokai'
    Plug 'dracula/vim'

    Plug 'gabrielelana/vim-markdown'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/tpope-vim-abolish'
    Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Configuração dos Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Configurações do highlight NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeShowLineNumbers = 1

" Configuração para o vim aceitar 256 cores
set t_Co=256

" Syntastic config
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1

" Configuracoes do javascript plugin
let g:javascript_plugin_jsdoc =  1

" debug ycm server
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Configuracoes visuais do airline
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" Mapeando a tecla de atalho do emmet
let g:user_emmet_leader_key=','


color dracula

if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif
