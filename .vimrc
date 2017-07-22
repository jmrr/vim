"            ---=== The Great VIM config ===---
"                    *** since 2014 ***        

" ISSUES:
" * Multi file/buffer replace
" * Multi file/buffer jump
" * Multi word refactoring
" * List usages
" * Surround
" * Single letter commands conflicts
" * Not all bracket jumps work
" * Remove breckets in pair

" ----------------------- settings -----------------------------

" Enable plugins
execute pathogen#infect()
colorscheme wombat256mod " Colorscheme wombat256
syntax on " Syntax on... any kind of
filetype plugin indent on " Use indentation scripts located in the indent folder
filetype plugin on " Enable plugin vim scripts located in ftplugin directory

set nocompatible " Disable vi compatibility
set nu " Set line numbers
set confirm " Confirm save on exit
set nowrap " lines will not wrap and only part of long lines will be displayed.
set spell " Spell check
set backspace=2 " Allow backspacing
set tabstop=4 " Short tabs
set shiftwidth=4 " 4 columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set list " Show trailing whitespaces
set listchars=trail:.,tab:>- " Show tabs as >-
set cursorline " Highlite current line
set backup " Keep a backup file
set backupdir=/private/tmp " Put backup files to tmp (specific for osx)
set dir=/private/tmp " Put swap files to tmp (specific for osx)
set pastetoggle=<leader>sp " Toggle paste mode
set foldmethod=manual " MAnual fold
" set foldlevel=10

let NERDTreeIgnore = ['\.swo$', '\.swp$'] " Let Nerdtree ignore vim backup files
let NERDTreeMapOpenInTab='\r' " Open files on new buffers
let NERDTreeShowHidden=1 " Show hidden files
let mapleader = "," " Set leader
let g:AutoPairsShortcutToggle = '<leader>pp' " Auto pairs toggle
"let g:AutoPairsShortcutFastWrap = '<leader>fw'

" ----------------------- mappings ------------------------------

" Down
nnoremap <C-j> <C-W><C-J>
" Up
nnoremap <C-k> <C-W><C-K>
" Right
nnoremap <C-l> <C-W><C-L>
" Left
nnoremap <C-h> <C-W><C-H>

" Replace after cursor
map <C-g> <C-v>$s

" Save with ,w
map <leader>w :w<CR>
" Exit with ,q
map <leader>q :q<CR>
" Save and exit with ,x
map <leader>x :wq<CR>
" Toggle nerdtree
map <leader>n :NERDTreeToggle<CR>
" Reset NERDTree
map <leader>N :NERDTree<CR>
" NerdTree default size
map <leader>v :BuffergatorToggle<CR>
" List recently edited files
map <leader>mr :MRU<CR>
" Next buffer
map <leader>f :bnext<CR>
" Previous buffer
map <leader>b :bprevious<CR>
" List buffers
map <leader>ls :ls<CR>
" Line break
map <leader>lb i<CR><Esc>
" ?
map <leader>ll :s/,/\0\r/g<CR>
" Remove trailing whitespaces
map <leader>dt :%s/\s\+$//e<CR>
" Reset search highlighting
map <F4> :set hlsearch! hlsearch?<CR>

" Custom functions. FIXME: make plugins
" Replace with confirmation
function! Refactor(old, new)
	exe 'set autowriteall'
	exe 'bufdo %s/' . a:old . '/' . a:new . '/gc'
endfunction

command -nargs=+ RefactorCmd :call Refactor(<f-args>)
vnoremap // y:RefactorCmd <C-R>" 

