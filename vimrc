set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" My Plugins
"
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'msanders/snipmate.vim'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'bronson/vim-visual-star-search'
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'othree/html5.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'hdima/python-syntax'
Plugin 'vim-scripts/gnupg.vim'

call vundle#end()

syntax on
filetype plugin on  
filetype plugin indent on

set nocompatible
set modelines=0

autocmd BufRead,BufNewFile *.phtml set ft=html
autocmd BufRead,BufNewFile *.tpl set ft=html
autocmd BufRead,BufNewFile markdown set ft=markdown
autocmd BufRead,BufNewFile inc set ft=php
autocmd BufRead,BufNewFile *.blade.php set ft=html

autocmd Filetype gitcommit setlocal spell textwidth=72

set autoindent  
set hlsearch
set smartindent  
set showmatch  
set number  
set ruler
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set laststatus=2
set tabstop=2  
set softtabstop=2  
set shiftwidth=2  
"set cursorline
"set noexpandtab  
set incsearch  
set ignorecase  
set autoread  
set nowrap  
set ttyfast
set textwidth=0
set bs=2
set wildmenu
set wildmode=list:longest
set wildignore+=*Zend*,.git,*bundles*,*.un~*
set undofile
set shortmess+=I
set mouse=
"set clipboard=unnamedplus

let NERDTreeQuitOnOpen=1  
map <C-c> :NERDTreeToggle<CR>  

inoremap jj <ESC>
nnoremap <CR> <C-^>  
nnoremap ; :
nnoremap p ]p
"nnoremap <C-w> :w<CR>

let mapleader = ","

map <leader>a :set wrap!<CR>
map <leader>b :source ~/.vim/vimrc<CR>:PluginInstall<CR>
map <leader>c :CtrlPClearCache<CR>
map <leader>k :nohlsearch<CR>  
map <leader>l :source ~/.vim/vimrc<CR>
map <leader>e :Extradite<CR>
map <leader>f :CommandTFlush<CR>
map <leader>n :set number!<CR>
map <leader>o :only<CR>
map <leader>p :set paste!<CR>
map <leader>q :wqa<CR>
map <Leader>r :%s/\<<C-r><C-w>\>/
map <leader>s :setlocal spell!<CR>
map <leader>t :CtrlP<CR>
map <leader>v :e ~/.vim/vimrc<CR>
map <leader>w :w<CR>
map <leader>y y :PBCopy<CR>
map <leader>= <c-w>=
map <leader>/ /<C-p>
lnoremap <leader>, <ESC>
noremap <leader>, <ESC>

"Easier splits navigation - Remapped Caps Lock to Control    
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Tabs!!!
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>

nnoremap <leader>m <C-w>\| 0

let g:sparkupExecuteMapping='<c-g>'

"SyntasticEnable php
let g:syntastic_auto_loc_list=1

" jslint testing
nmap <F4> :w<CR>:make<CR>:cw<CR>


let g:ctrlp_max_height = 30

" airline config
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
"let g:airline_symbols.branch = '⎇'
let g:airline#extensions#branch#enabled = 1
"let g:airline_branch_empty_message = '[no branch]'


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


" don't let the cursor move back one position when leaving insert mode to command mode
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" set for vim-gitgutter
highlight clear SignColumn

"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
