set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ===={ My Plugin }====
"
" --{Ctrl-p}--
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'kien/ctrlp.vim'

" --{vim-airline}--
" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

" --{NerdCommenter}--
" Easy commenting/uncommenting commands
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" ===={ My Configuration }====
" [Vim-airline] Automatically displays all buffers when there's only one tab
" open.
let g:airline#extensions#tabline#enabled = 1

