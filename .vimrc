syntax on

let g:NERDTreeDirArrows=0

set number
set relativenumber
set modifiable

set incsearch
set hlsearch

" fold Config
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

set nowrap
setglobal fileencoding=utf-8
let g:gruvbox_termcolors=16

autocmd vimenter * NERDTree

set list lcs=tab:\|\ 
let g:airline_solarized_bg='molokai'

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    
    Plug 'scrooloose/nerdcommenter'

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
    Plug 'mxw/vim-jsx'
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
    Plug 'easymotion/vim-easymotion'

    Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'branch': 'release/1.x',
    \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'markdown',
      \ 'vue',
      \ 'lua',
      \ 'php',
      \ 'python',
      \ 'ruby',
      \ 'html',
      \ 'swift' ] }

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
let NERDTreeIgnore=['node_modules', '\~$']

nmap <F4> :NERDTreeToggle<CR>


" Map keys of ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" map Easymotion
nmap <Space> <Plug>(easymotion-overwin-f)

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'

let g:ycm_auto_trigger = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_invoke_completion = '<C-Space>' 
let g:SuperTabCrMapping                = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

 " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

let g:ale_fixers = {'javascript': ['prettier_standard'], 'typescript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_completion_enabled = 1

let g:syntastic_typescript_tsc_fname = ''

autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd BufRead,BufNewFile *.tsx setlocal syntax=javascript.jsx

 " Prettier config
let g:prettier#exec_cmd_path = "~/.nvm/versions/node/v10.15.3/bin/prettier-standard"

nmap <silent> <Leader>p :ALEFix<CR>

colorscheme molokai
color gruvbox

if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
