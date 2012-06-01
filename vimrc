"" .vimrc

colorscheme evening_black

if has('iconv')
  runtime detect_encoding.vim
else
  set fileencodings=ucs-bom,iso-2022-jp,shift-jis,euc-jp,utf-8
  set fileformats=dos,unix,mac
endif

set noerrorbells
set visualbell
set number
set showcmd
set incsearch
set scrolloff=5

filetype plugin on

" Indentations
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

map <C-K> :pyf /usr/share/vim/vimfiles/syntax/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/share/vim/vimfiles/syntax/clang-format.py<cr>
