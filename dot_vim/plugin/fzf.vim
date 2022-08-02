nnoremap <C-T> :Files<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <C-Y> :History<CR>

" Make jump to tag open up FZF
nnoremap <c-]> :Tags <c-r><c-w><cr>

nnoremap \ :Ag<space>
nnoremap K :Ag <C-R><C-W><CR>

let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_preview_window = ['up:40%', 'ctrl-\']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.9, 'yoffset': 0.2 } }
