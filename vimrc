" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Vundle configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'FelikZ/ctrlp-py-matcher'
  Plugin 'easymotion/vim-easymotion'
  Plugin 'junegunn/rainbow_parentheses.vim'
  " More plugins here...
  call vundle#end()
else
  echomsg 'Vundle is not installed; no plugins are active.'
endif

" All plugins must be added before the following line.
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

" Editor apperance
" Show line numbers
set number
" Show column/line number in status bar
set ruler
" Keep status line always on
set laststatus=2
" Set textwidth; this may be reset by specific language configs.
set textwidth=80
" Wildmenu provides visual bar including other files with the prefix.
set wildmenu
" Case insensitive wildmenu completion
set wildignorecase
" Exclude unwanted files from wildmenu.
set wildignore=*.pyc,*.exe,*.so,*.dll,*.swp
" Split more intuitively.
set splitbelow
set splitright
" Use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Editor Behavior
" Explicitly enable backspacing over complex whitespace.
set backspace=indent,eol,start
set hidden  " Allow hidden buffers.

" Create indent folds, but leave them unfolded.
set foldmethod=indent
set foldlevel=100 " Arbitrary large number.

" Tabbing
" Let tabs and indents appear as width 2. These should always be equal.
set shiftwidth=2
set tabstop=2
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
" Quickly clear highlights after searches
nnoremap <leader><space> :noh<cr>

" Plugin behavior tweaks.
" Refresh results every 100ms, so we don't make too many searches.
let g:ctrlp_lazy_update = 100
" Exclude git, hg, and npm directories from ctrl-p searches
" \v = very magic -> e.g. all special characters have special meaning in regex.
let g:ctrlp_custom_ignore = {'dir':  '\v\/(\.(git|hg|svn)|node_modules)$'}

if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
else
  echo 'pymatcher requires +python compiled vim.'
endif

" If installed, use rg instead of grep and for ctrlp.
" https://github.com/burntsushi/ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" Activate RainbowParentheses for Python, C++
augroup rainbow_parens
  " Only import once.
  autocmd!
  autocmd FileType py,cpp RainbowParentheses
augroup END
