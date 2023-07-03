-- global function that can be called anywhere to color the nvim ide
function ColorMyIDE(color)
	-- color the default rose-pine
	--color = color or 'rose-pine'
	-- default color catpuccin
	color = color or 'catppuccin'
	-- set the color scheme
	vim.cmd.colorscheme(color)


	-- make neovim transparent
	-- 0 for global space so every window gets this.
	-- Normal is just vim,
	-- background should equal none
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyIDE()
