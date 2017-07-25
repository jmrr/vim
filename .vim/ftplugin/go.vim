" ------------------- Go settings ------------------------
" No need to show invisibles
set nolist

" Enable highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 0

" Fix syntastic compatibility
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Auto imports
let g:go_fmt_command = "goimports"

" ------------------- Mappings ----------------------------
map <leader>c <Plug>(go-coverage)
map <leader>t <Plug>(go-test)
map <leader>i <Plug>(go-info)
map <leader>gi :GoImplement<CR>
map <leader>gd :GoDef<CR>
map <leader>gt :GoTests<CR>
map <leader>gb :GoBuild<CR>
map <F7> :GoFmt<CR>zO
" Functions declared in the file
map <leader>dc :GoDecls<CR>
" Functions declared in the directory
map <leader>dcl :GoDeclsDir<CR>
" Linters
map <leader>gv :GoVet<CR>
map <leader>gl :GoLint<CR>
"List callers
map <leader>gc :GoCallers<CR>
" List references to variable
map <leader>gr :GoReferrers<CR>
" Describe tipe: methods, attrs, definitions
map <leader>ge :GoDescribe<CR>
" List types implements error
map <leader>we :GoWhicherrs<CR>
" List channel peers
map <leader>chp :GoChannelPeers
" List functions which could be called by the func
map <leader>fc :GoCallees<CR>
" Call stack
map <leader>cs :GoCallees<CR>
" Refactor word under cursor
map <leader>rf :GoRename<CR>
" List free vars
map <leader>fv :'<,'>GoFreevars<CR>
