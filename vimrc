" Plugin
call plug#begin()
  Plug 'crusoexia/vim-monokai'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'vim-scripts/FuzzyFinder'
  Plug 'vim-scripts/L9'
  Plug 'PProvost/vim-ps1'
call plug#end()

" Color
syntax on
colorscheme monokai

" Visual
set noerrorbells
set visualbell
set number
set showcmd
set incsearch
set scrolloff=5

" Indentation
set autoindent
set smartindent
set expandtab

" Misc
filetype plugin on
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
