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

" --{YouCompleteMe}--
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine
" for Valloricm

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

" --{Autocompletion}--
" Provide Auto completion for various language
Plugin 'Valloric/YouCompleteMe'

" --{syntactic}--
" Syntaxcheck
Plugin 'scrooloose/syntastic'

" --{vim-flake8}--
"  Pep8 style checker
Plugin 'nvie/vim-flake8'



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

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Make sure that extra margin on left is removed
set foldcolumn=0

" Enable Ctrl-A/Ctrl-X to work on octal and hex numbers, as well as
" characters
set nrformats=octal,hex,alpha

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"------------------------------------------------------------------------------
"" Files, backups and undo
"------------------------------------------------------------------------------
"
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"------------------------------------------------------------------------------
"" Text, tab and indent related
"------------------------------------------------------------------------------
"
"" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Don't Wrap lines (it is stupid)

" ===={ My Configuration }====
" [Vim-airline] Automatically displays all buffers when there's only one tab
" open.
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

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

" Close the current buffer (w/o closing the current window)
map <C-b>d :Bclose<cr>

" Close all the buffers
map <leader>bda :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <C-t>n :tabnew<cr>
map <C-t>o :tabonly<cr>
map <C-t>c :tabclose<cr>
map <C-t>m :tabmove<cr>
map <C-t>l :tabnext<cr>
map <C-t>h :tabprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <C-t>e :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Allow to copy/paste between VIM instances
"copy the current visual selection to ~/.vbuf
vmap <leader>y :w! ~/.vbuf<cr>

"copy the current line to the buffer file if no visual selection
nmap <leader>y :.w! ~/.vbuf<cr>

"paste the contents of the buffer file
nmap <leader>p :r ~/.vbuf<cr>

" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<esc>hhkywjl?@@@<CR>P/@@@<cr>3s

" turn off search highlighting (type <leader>n to de-select everything)
nmap <silent> <leader>n :silent :nohlsearch<cr>

nmap <F8> :TagbarToggle<CR>


"------------------------------------------------------------------------------
" YouCompleteMe
"------------------------------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"------------------------------------------------------------------------------
"" NERDTree
"------------------------------------------------------------------------------
"
"" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Locate file in hierarchy quickly
map <C-f> :NERDTreeFind<cr>

" Toogle on/off
nmap <C-o> :NERDTreeToggle<cr>

"------------------------------------------------------------------------------
"" Vim-go
"------------------------------------------------------------------------------
let g:go_fmt_fail_silently = 1
"
" Show a list of interfaces which is implemented by the type under your
" cursor
au FileType go nmap <C-g>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <C-g>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <C-g>d <Plug>(go-doc)
au FileType go nmap <C-g>v <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <C-g>b <Plug>(go-doc-browser)

" " Run/build/test/coverage
au FileType go nmap <C-g>r <Plug>(go-run)
au FileType go nmap <C-g>b <Plug>(go-build)
au FileType go nmap <C-g>t <Plug>(go-test)
au FileType go nmap <C-g>c <Plug>(go-coverage)
" Call GoFmt
au FileType go nmap <C-g>f :GoFmt<cr>

" By default syntax-highlighting for Functions, Methods and Structs is
" disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"------------------------------------------------------------------------------
" Python
"------------------------------------------------------------------------------
let python_highlight_all=1

au BufNewFile, BufRead *.py set tabstop=4 set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
