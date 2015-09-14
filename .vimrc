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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" ===={ My Configuration }====
" [Vim-airline] Automatically displays all buffers when there's only one tab
" open.
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

set laststatus=2

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
