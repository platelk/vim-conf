set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ===={ My Plugin }====
"
" --{Powerline}--
" Powerline is a statusline plugin for vim
Plugin 'powerline/powerline'

" --{Ctrl-p}--
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'

" --{vim-airline}--
" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

" --{NerdCommenter}--
" Easy commenting/uncommenting commands
Plugin 'scrooloose/nerdcommenter'

" --{NerdTree}--
" The NERD tree allows you to explore your filesystem and to open files and
" directories. 
Plugin 'scrooloose/nerdtree'

" --{NerdTreeGit}--
" A plugin of NERDTree showing git status flags. 
Plugin 'Xuyuanp/nerdtree-git-plugin'

" --{NerdTreeTabs}--
" This plugin aims at making NERDTree feel like a true panel, independent of
" tabs.
Plugin 'jistr/vim-nerdtree-tabs'

" --{vim-surround}--
" Surround.vim is all about "surroundings"
Plugin 'tpope/vim-surround'

" --{neocomplete}--
" neocomplete is the abbreviation of "neo-completion with cache"
Plugin 'Shougo/neocomplete.vim'

" --{YouCompleteMe}--
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
" for Valloricm
" Plugin 'Valloric/YouCompleteMe'

" --{Csapprox}--
" Make gvim-only colorschemes work transparently in terminal vim
Plugin 'godlygeek/csapprox'

" --{vim-go}--
" Go (golang) support for Vim 
Plugin 'fatih/vim-go'

" --{tagbar}--
" Vim plugin that displays tags in a window, ordered by scope 
Plugin 'majutsushi/tagbar'

" --{Molokai}--
" Molokai color scheme for Vim
Plugin 'fatih/molokai'

" --{go-explorer}--
" Go Explorer is Vim plugin for exploring Go code
Plugin 'garyburd/go-explorer'

" --{dart-vim-plugin}--
" Syntax highlighting for Dart in Vim
Plugin 'dart-lang/dart-vim-plugin'

" --{tmux.vim}--
" Simple tmux statusline generator
Plugin 'edkolev/tmuxline.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/dart-vim-plugin
endif
 filetype plugin indent on

" To ignore plugin indent changes, instead use:
filetype plugin on
syntax on
set number
set ruler
set showcmd
set backspace=indent,eol,start
set incsearch
set hlsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" ===={ My Configuration }====
" [Vim-airline] Automatically displays all buffers when there's only one tab
" open.
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

set laststatus=2

" change the mapleader from \ to ,
let mapleader=","

set hidden
" ignore case when searching
set ignorecase    
" ignore case if search pattern is all lowercase,
" case-sensitive otherwise
set smartcase
" insert tabs on the start of a
"    line according to
"    shiftwidth, not tabstop
set smarttab      

" highlight search terms
set hlsearch      

" show search matches as you type
set incsearch     

" copy the previous indentation on autoindenting
set copyindent    

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-k>v <C-w>v
map <C-k>h <C-w>s
map <C-k>k <C-w>w
map <C-k>q <C-w>q

map <C-k>o :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
let g:neocomplete#enable_cursor_hold_i = 1
"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
