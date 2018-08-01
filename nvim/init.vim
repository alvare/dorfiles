" pathogen
execute pathogen#infect()

filetype plugin on
syntax on

"set t_Co=256
" saner J
set formatoptions+=j
set mouse=nv
set pastetoggle=<F10>
"filetype plugin indent on
au BufNewFile,BufRead *.twig set filetype=htmldjango
au BufNewFile,BufRead *.rs setlocal ft=rust
au BufNewFile,BufRead *.scala setlocal ft=scala
au BufNewFile,BufRead *.ijs setlocal ft=j
au BufNewFile,BufRead *.less setlocal ft=less

let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
"let hs_highlight_more_types = 1
let hs_highlight_debug = 1
let hs_allow_hash_operator = 1


set bg=dark
" solarized options
colorscheme solarized
let g:solarized_italic=0

set ignorecase
au GUIEnter * simalt ~x
set guifont=Source_Code_Pro_Light:h10:cANSI
set guioptions=egrLt
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set noswapfile
set foldminlines=4
" hilight current line
set cursorline
" split always to the right
set splitright
set splitbelow
set completeopt=menuone,menu,preview

set t_vb=
set vb
set hlsearch

" encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" the mappings
let mapleader=","
let maplocalleader="-"
"nmap <tab> :tabnext<CR>
"nmap <S-tab> :tabprevious<CR>
"nmap <F8> :TagbarToggle<CR>
nnoremap Y y$
"noremap º ^
"nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
vmap <silent> <Leader>h :s/á\\|é\\|í\\|ó\\|ú\\|¡\\|ñ/\={"á": "&aacute;", "é": "&eacute;", "í": "&iacute;", "ó": "&oacute;", "ú": "&uacute;", "¡": "&iexcl;", "ñ": "&ntilde;"}[submatch(0)]/g<CR>
nmap <silent> <Leader>h :s/á\\|é\\|í\\|ó\\|ú\\|¡\\|ñ/\={"á": "&aacute;", "é": "&eacute;", "í": "&iacute;", "ó": "&oacute;", "ú": "&uacute;", "¡": "&iexcl;", "ñ": "&ntilde;"}[submatch(0)]/g<CR>
"super diff para cuando cambia el archivo
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" hilighting off
nnoremap <silent> <Leader>s :nohls<CR>

" isort
nmap <silent> <Leader>s :%!isort -

" ctrlp
nnoremap <C-b> :CtrlPBuffer<CR>

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
set hidden

" ignores for nerdtree and ctrlp
set wildignore+=*/node_modules/*

" force learning hjkl
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" displays invisible characters
exec "set listchars=tab:>\\ ,trail:\uB7,nbsp:~"
set list
nnoremap <silent> <Leader>p :set list!<CR>

" fuck shift+;
nnoremap ; :
vnoremap ; :

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['94', 'SeaGreen3'],
    \ ['54', 'SeaGreen3'],
    \ ['52', 'RoyalBlue3'],
    \ ['28', 'SeaGreen3'],
    \ ['21', 'RoyalBlue3'],
    \ ['10', 'DarkOrchid3'],
    \ ['7', 'firebrick3'],
    \ ['4', 'RoyalBlue3'],
    \ ['208', 'SeaGreen3'],
    \ ['9', 'firebrick3'],
    \ ['76', 'DarkOrchid3'],
    \ ['190', 'DarkOrchid3'],
    \ ['5', 'firebrick3'],
    \ ['202', 'RoyalBlue3'],
    \ ['13', 'firebrick3'],
    \ ['1', 'DarkOrchid3'],
    \ ]

" vim-sexp
let g:sexp_enable_insert_mode_mappings = 0

" title for bash
set title
set titlestring=%{substitute(getcwd(),'^.*/','','')}\ -\ %t%m
set titleold=Terminal

" vim-airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

" easy macroing
nnoremap Q @q
vnoremap Q :norm @q<cr>

" simple split switching
noremap <C-j> <C-w><C-w>
noremap <C-k> <C-w>W

" simple yank to common buffers
vnoremap <silent> <Leader>y "*y
vnoremap <silent> <Leader>Y "+y

" python shortcuts
nnoremap <silent> <Leader>d Oimport ipdb;ipdb.set_trace()<Esc>
nnoremap <silent> <Leader>l Oimport logging; logging.getLogger(__name__).warning()<Esc>

" ghcmod binds
nnoremap <silent> <Leader>m :wa<CR>:GhcModCheck<CR>

" fortran90
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1

" coq
au FileType coq call coquille#FNMapping()
