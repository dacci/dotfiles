" Perl specific settings

set iskeyword+=:
set complete+=k~/.vim/perl/modules.lst

"source ~/.vim/perl/quick_fix.vim
let perl_synwrite_qf = 1

map ,pt <Esc>:%! perltidy -pbp<Cr>
map ,ptv <Esc>:'<,'>! perltidy -pbp<Cr>
