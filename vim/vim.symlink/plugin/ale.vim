" Turn off all highlights cuz they're ugly
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'typescript': ['tslint'],
\}
let g:ale_fix_on_save = 1
