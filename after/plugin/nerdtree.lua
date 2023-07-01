vim.g.nerdtree_tabs_open_on_gui_startup = 1
vim.g.nerdtree_tabs_open_on_console_startup = 1
vim.g.nerdtree_tabs_no_startup_for_diff = 1
vim.g.nerdtree_tabs_smart_startup_focus = 2
vim.g.nerdtree_tabs_meaningful_tab_names = 1
vim.g.nerdtree_tabs_autoclose = 1
vim.g.nerdtree_tabs_synchronize_view = 1
vim.g.nerdtree_tabs_synchronize_focus = 1
vim.g.nerdtree_tabs_focus_on_files = 0
vim.g.nerdtree_tabs_startup_cd = 1
vim.g.NERDTreeWinSize = 30
vim.g.NERDTreeHighlightCursorline = 1
vim.g.NERDTreeMouseMode = 1

local autocmd = vim.api.nvim_create_autocmd

-- Start NERDTree and leave the cursor in it.
autocmd('VimEnter', {
    pattern = '*',
    command = 'NERDTree'
})

-- Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd('BufEnter', {
    pattern = '*',
    command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif"
})

-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
--autocmd('BufEnter', {
--    pattern = '*',
--    command = "if bufname('#') =~ 'NERD_tree_\\d\\+' && bufname('%') !~ 'NERD_tree\\d\\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute \"normal! \\<C-W>w\" | execute 'buffer'.buf | endif"
--})

-- Start NERDTree. If a file is specified, move the cursor to its window.
autocmd('StdinReadPre', {
    pattern = '*',
    command = 'let s:std_in=1'
})
autocmd('VimEnter', {
    pattern = '*',
    command = 'NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif'
})
