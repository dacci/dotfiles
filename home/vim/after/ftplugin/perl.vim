" Perl specific settings

set iskeyword+=:

let perl_synwrite_qf = 1

map ,pt <Esc>:%! perltidy -pbp<Cr>
map ,ptv <Esc>:'<,'>! perltidy -pbp<Cr>
