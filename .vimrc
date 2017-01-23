execute pathogen#infect()
syntax on
filetype plugin indent on

"=====PUT ALL NON-PLUGIN VIM CONFIGURATIONS IN HERE

"=====CSCOPE (mappings and support from any directory)
"if has('cscope')
"source $HOME/.vim/plugin/cscope_maps.vim
"cs add $HOME/os161/src/cscope.out $HOME/os161/src/
"endif

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

"=====Fill in white space with special chars
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
"====Mouse Settings====
set mouse=a             " Enables mouse in all (a) modes
set ttymouse=xterm2     " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm

set shell=/bin/sh
autocmd FileType nerdtree nmap <buffer> <left> u
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | endif

set laststatus=2
set statusline=%!getcwd()

cd /home/avi/os161
