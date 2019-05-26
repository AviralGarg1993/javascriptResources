set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox' " colorscheme
Plugin 'scrooloose/nerdtree' " nerdtree
Plugin 'rip-rip/clang_complete' " c_lang
Plugin 'oblitum/youcompleteme' " c_lang
Plugin 'tpope/vim-surround' " surround (parathesis stuff)
Plugin 'omnisharp/omnisharp-vim' " C#
Plugin 'vim-airline/vim-airline'" 
Plugin 'kien/ctrlp.vim' " https://vimawesome.com/plugin/ctrlp-vim-red
Plugin 'easymotion/vim-easymotion'




call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"====Mapping for C_lang====
map <F8> :w <CR> :!clear <CR> :!gcc % -o %< && ./%< <CR>

"======= Key Mappings ========
map <C-n> :NERDTreeToggle<CR>
"=====remap leader \ to be ,
let mapleader = ","

"=====open vimrc in split with ',v' in normal mode
no <leader>v :vsplit $MYVIMRC<CR>

"=====automically source vimrc whenever you write
if has("autocmd")
autocmd bufwritepost .vimrc source $MYVIMRC
endif
"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list

"=====Set tabs to be 4 spaces
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

"=====Fix backspace problems with vim 7.4 on osx 10.10.5
"set backspace=indent,eol,start

"=====Mark text beyond 81st column
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+',-1)

"share vim and system clipboard for easier copy pastes
set clipboard=unnamed

"search configuration
set hlsearch
hi Search ctermbg=LightGreen

"general configuration
set laststatus=2
"colorscheme favorites - tomorrow night, tomorrow night blue, appretice,
" babymate256, busybee, clue, coldgreen, colorzone,
" Chasing_Logi
syntax enable
set background=dark
colorscheme gruvbox
if $COLORTERM == 'gnome-terminal'
	  set t_Co=256
	endif
set number

"====Adds transparency====
hi Normal ctermbg=NONE guibg=NONE

"====Mouse Settings====
set mouse=a             " Enables mouse in all (a) modes
set ttymouse=xterm2     " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm

set shell=/bin/sh
autocmd FileType nerdtree nmap <buffer> <left> u
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | endif

set laststatus=2
set statusline=%!getcwd()
