" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Vundle configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'ctrlpvim/ctrlp.vim'
  " More plugins here...
  call vundle#end()
else
  echomsg 'Vundle is not installed; no plugins are active.'
endif

" All of plugins must be added before the following line.
filetype plugin indent on
syntax on

let mapleader = ","
set encoding=utf-8

" Key remaps
inoremap jj <esc>
inoremap JJ <esc>
nnoremap <C-t>p :tabp<cr>
nnoremap <C-t>n :tabn<cr>
nnoremap <C-t>t :tabnew<cr>
" Quickly clear highlights after searches
nnoremap <leader><space> :noh<cr>

" Editor apperance
" Show line numbers
set number
" Show column/line number in status bar
set ruler
" Keep status line always on
set laststatus=2
" Set textwidth; this may be reset by specific language configs.
set textwidth=80
" Don't write into the colored column
" TODO Configure autoformatting tools, instead of using colorcolumn
set colorcolumn=+1
" Wildmenu provides visual bar including other files with the prefix.
set wildmenu
" Case insensitive wildmenu completion
set wildignorecase
" Exclude unwanted files from wildmenu.
set wildignore=*.pyc,*.exe,*.so,*.dll
" Use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Editor Behavior
" Explicitly enable backspacing over complex whitespace.
set backspace=indent,eol,start

" Tabbing
" Let tabs and indents appear as width 4. These should always be equal.
set shiftwidth=4
set tabstop=4
" Indents go to the next closest tab.
set shiftround
" Use spaces, not tabs!
set expandtab
" Delete tabs together, instead of needing to delete multiple spaces.
set smarttab
" Follow behavior of the previous line, improved by C-like syntax information.
set autoindent
set smartindent

" Search Settings
" Highlight search terms
set hlsearch
" Search as you type
set incsearch
" Case insensitive, except if we include caps in search query
set ignorecase
set smartcase

" Plugin behavior tweaks
" Refresh results every 100ms, so we don't make too many searches.
let g:ctrlp_lazy_update = 100
" Exclude git, hg, and npm directories from ctrl-p searches
" \v = very magic -> e.g. all special characters have special meaning in regex.
let g:ctrlp_custom_ignore = {'dir':  '\v\/(\.(git|hg|svn)|node_modules)$'}

" If installed, use ag instead of grep and for ctrlp.
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

