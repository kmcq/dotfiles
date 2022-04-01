if has('nvim')
lua <<EOF
require('gitsigns').setup{
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      vim.api.nvim_set_keymap(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>gs', ':Gitsigns stage_hunk<CR>')

    -- Actions to maybe use
    map('n', '<leader>gS', ':Gitsigns stage_buffer<CR>')
    map('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>gR', ':Gitsigns reset_buffer<CR>')
    map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
    map('n', '<leader>gb', ':Gitsigns blame_line<CR>')

    -- Toggles
    map('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>td', ':Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF
endif
