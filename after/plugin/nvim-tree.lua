local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings.
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "<leader>t", ":NvimTreeToggle <CR>")
end

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 23,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = my_on_attach,
})

-- From https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local function open_nvim_tree(data)
	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if not real_file and not no_name then
		return
	end

	-- open the tree, find the file but don't focus it
	require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- auto close
local function is_modified_buffer_open(buffers)
	for _, v in pairs(buffers) do
		if v.name:match("NvimTree_") == nil then
			return true
		end
	end
	return false
end

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if
			#vim.api.nvim_list_wins() == 1
			and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
			and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
		then
			vim.cmd("quit")
		end
	end,
})
