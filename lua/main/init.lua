require("main.set")
require("main.remap")

local augroup = vim.api.nvim_create_augroup
local MainGroup = augroup('MainGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
	require ("plenary.reload").reload_module(name)
end


autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = MainGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_brower_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
