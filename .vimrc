syntax on

let g:NERDTreeDirArrows=0

set number
set relativenumber
set modifiable

set incsearch
set hlsearch

set nowrap
setglobal fileencoding=utf-8

autocmd vimenter * NERDTree

set list lcs=tab:\|\ 
let g:airline_solarized_bg='molokai'

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

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
    Plug 'Quramy/tsuquyomi'
    Plug 'Valloric/YouCompleteMe'
    Plug 'w0rp/ale'
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

    Plug 'tpope/vim-dadbod'
    Plug 'Galooshi/vim-import-js'
    Plug 'epilande/vim-react-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
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

let g:NERDTreeShowLineNumbers = 1
let NERDTreeIgnore=['node_modules', '\~$']

nmap <F4> :NERDTreeToggle<CR>


" Map keys of ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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

" Ctrl-p ignore folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ycm_auto_trigger = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_invoke_completion = '<C-Space>' 
let g:SuperTabCrMapping                = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsListSnippets = '<C-l>'

 " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"

let g:ale_fixers = ['eslint']

autocmd FileType typescript setlocal completeopt+=menu,preview

color dracula

if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif
