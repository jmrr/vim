"            ---=== The Great VIM config ===---
"                    *** since 2014 ***
"
" --------------------- Vundle Plugins -------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'git@github.com:jiangmiao/auto-pairs.git'
Plugin 'git@github.com:scrooloose/nerdcommenter.git'
Plugin 'git@github.com:tomtom/tlib_vim.git'
Plugin 'git@github.com:vim-airline/vim-airline.git'
Plugin 'git@github.com:jeetsukumaran/vim-buffergator.git'
Plugin 'git@github.com:garbas/vim-snipmate.git'
Plugin 'git@github.com:honza/vim-snippets.git'
Plugin 'git@github.com:michalbachowski/vim-wombat256mod.git'
Plugin 'git@github.com:MarcWeber/vim-addon-mw-utils.git'
Plugin 'git@github.com:tpope/vim-surround.git'
Plugin 'git@github.com:tpope/vim-eunuch.git'
Plugin 'git@github.com:airblade/vim-gitgutter.git'
Plugin 'git@github.com:scrooloose/nerdtree.git'

" Python specific
Plugin 'git@github.com:davidhalter/jedi-vim.git'
Plugin 'git@github.com:jeetsukumaran/vim-indentwise.git'
Plugin 'git@github.com:vim-python/python-syntax.git'
Plugin 'git@github.com:w0rp/ale.git'
Plugin 'git@github.com:tell-k/vim-autopep8.git'

" Go specific
Plugin 'git@github.com:fatih/vim-go.git'

call vundle#end()            " required

" ----------------------- settings -----------------------------

filetype plugin indent on " Use indentation scripts located in the indent folder
filetype plugin on " Enable plugin vim scripts located in ftplugin directory
syntax on " Syntax on... Any kind of
colorscheme wombat256mod " Color scheme wombat256

set nocompatible " Disable vi compatibility
set nu " Set line numbers
set confirm " Confirm save on exit
set nowrap " lines will not wrap and only part of long lines will be displayed.
set spell " Spell check
set tabstop=4 " Short tabs
set shiftwidth=4 " 4 columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set list " Show trailing white spaces
set listchars=trail:.,tab:>- " Show tabs as >-
set cursorline " Highlight current line
set backup " Keep a backup file
set backupdir=/private/tmp " Put backup files to tmp (specific for osx)
set dir=/private/tmp " Put swap files to tmp (specific for osx)
set pastetoggle=<f5> " Toggle paste mode
set foldmethod=syntax " Fold by syntax blocks
set foldlevel=10 " Keep folds opened
set scrolloff=50 " Keep cursor centered

let mapleader = "," " Set leader
let g:AutoPairsShortcutToggle = '<leader>pp' " Auto pairs toggle
" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['*\.pyc$', '\.egg-info[[dir]]', '__pycache__', 'build', 'dist']
" ----------------------- mappings ------------------------------

" Normal mode
" Down
nnoremap <C-j> <C-W><C-J>
" Up
nnoremap <C-k> <C-W><C-K>
" Right
nnoremap <C-l> <C-W><C-L>
" Left
nnoremap <C-h> <C-W><C-H>
"inoremap <C-h> <Left>
" Save with ,w
noremap <leader>w :w<CR>
" Exit with ,q
noremap <leader>q :q<CR>
" Save and exit with ,x
noremap <leader>x :wq<CR>
" NERDTree toggle
noremap <leader>n :NERDTreeToggle<CR>
" Explore buffers
nnoremap <leader>v :BuffergatorToggle<CR>
" Line break
noremap <leader>lb i<CR><Esc>
" Remove trailing white spaces
noremap <leader>dt :%s/\s\+$//e<CR>
" Reset search highlighting
noremap <F4> :set hlsearch! hlsearch?<CR>
" Show mappings
nnoremap <leader>mp :map<CR>
" Show index
nnoremap <leader>hi :help index<CR>
" Remove brackets in pair
nnoremap <leader>bb %ma%x`ax
" Install plugins
nnoremap <leader>pl :PluginInstall<CR>

" Insert mode no-arrows navigation
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" System specific mappings
if has('macunix')
	" Add line below
	nnoremap <C-o> :set paste<CR>m`o<Esc>``:set nopaste<CR>
	" Add line above
	nnoremap Ø :set paste<CR>m`O<Esc>``:set nopaste<CR>
	" Move line down <A-m>
	nnoremap µ :m .+1<CR>==
	" Move line up: <A-d>
	nnoremap ∂ :m .-2<CR>==
	" Paste from + register with <A-v>
	inoremap √ <c-r><c-o>+
elseif has('unix')
	" Add line below
	nnoremap <silent>ø :set paste<CR>m`o<Esc>``:set nopaste<CR>
	" Add line above
	nnoremap <silent>Ø :set paste<CR>m`O<Esc>``:set nopaste<CR>
	" Move line down
	nnoremap µ :m .+1<CR>==
	" Move line up
	nnoremap ∂ :m .-2<CR>==
	" Paste from + register with <A-v>
	inoremap √ <c-r><c-o>+
endif

" Remember last position of file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
