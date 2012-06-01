" Perl specific settings

set iskeyword+=:
set complete+=k~/.vim/perl/modules.lst

"source ~/.vim/perl/quick_fix.vim
let perl_synwrite_qf = 1

map ,pt <Esc>:%! perltidy<Cr>
map ,ptv <Esc>:'<,'>! perltidy<Cr>

set softtabstop=4
set shiftwidth=4
