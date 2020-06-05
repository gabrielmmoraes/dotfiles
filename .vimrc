set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               "Plugin manager

" Dev tools
Plugin 'tpope/vim-commentary'               "Plugin para comentários
Plugin 'ycm-core/YouCompleteMe'             "Autocompleter
Plugin 'dense-analysis/ale'                 "Plugin para linter
Plugin 'amix/open_file_under_cursor.vim'    "Abrir arquivo no path selecionado
Plugin 'scrooloose/nerdtree'                "File tree
Plugin 'leafgarland/typescript-vim'         "Plugin for typescript
Plugin 'peitalin/vim-jsx-typescript'        "JSX synthax highlighter

" Language Server Protocol
" Rodar :CocInstall <lista extensoes>
Plugin 'neoclide/coc.nvim'                  "LSP do VSCode
Plugin 'neoclide/coc-tsserver'
Plugin 'neoclide/coc-json'
Plugin 'josa42/coc-go'
Plugin 'neoclide/coc-tslint'

" Git
Plugin 'itchyny/vim-gitbranch'              "Mostra branch atual
Plugin 'tpope/vim-fugitive'                 "Integração com git

" Temas e interface
Plugin 'morhetz/gruvbox'                    "Colorscheme
Plugin 'vim-airline/vim-airline'            "Linha de comando
Plugin 'vim-airline/vim-airline-themes'     "Temas para linha de comando

call vundle#end()
filetype plugin indent on

set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_improved_strings=1
colorscheme gruvbox

set nu
syntax on
set relativenumber
set encoding=utf-8
set showcmd
set tabstop=4 shiftwidth=4
set expandtab

set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set updatetime=50
set laststatus=2

" Nerdtree
let NERDTreeMinimalUI = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen=1

"Vim Airline
let g:airline_powerline_fonts = 1

" Setando arquivos .jsx como typescript.tsx para highlight
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Remaps
let mapleader=" "
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
