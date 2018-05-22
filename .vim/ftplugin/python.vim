
" ------------------- Settings ----------------------------

" 80 symbols color column
set colorcolumn=120
highlight ColorColumn ctermbg=233
highlight OverLength ctermfg=244
match OverLength /\%120v.*/

" Enable advanced python syntax
let g:python_highlight_all = 1

" ------------------- Mappings ---------------------------
" Jedi
let g:jedi#goto_command = "<leader>jc"
let g:jedi#goto_assignments_command = "<leader>ja"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "jo"
let g:jedi#usages_command = "<leader>ju"
let g:jedi#completions_command = "<C-Spase>"
let g:jedi#rename_command = "<leader>jr"

" AutoPEP8
nnoremap <leader>8 :Autopep8<CR>
let g:autopep8_aggressive=2
let g:autopep8_diff_type='vertical'
