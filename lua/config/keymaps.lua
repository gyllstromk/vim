-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local opts = { noremap = true, silent = true }
local bufopts = { noremap = true, silent = true }

-- gylls remove these
cmd("unmap H")
cmd("unmap L")
cmd("unmap n") -- for some reason the new config always defaults n to next (top down) instead of n (search direction)
cmd("unmap N")
--cmd("unmap <leader>l")

--cmd("unmap <S-tab>")
-- endgylls

-- map arrow keys to pane shifts.
map("n", "<Up>", "<C-w><C-k>", { noremap = true })
map("n", "<Down>", "<C-w><C-j>", { noremap = true })
map("n", "<Left>", "<C-w><C-h>", { noremap = true })
map("n", "<Right>", "<C-w><C-l>", { noremap = true })

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command W w")
cmd("command Q q")

-- using Meta/Alt can result in <Esc> being interpreted as Meta/Alt, which makes
-- for odd behaviors when quickly pressing <Esc> sometimes, so disable Meta
-- chords.
-- https://github.com/neovim/neovim/issues/20064
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del({ "n" }, "<leader>l")
vim.keymap.set({ "n" }, "<leader>l", ":HgBlame<cr>", opts)

vim.keymap.set("n", "<leader>a", ":Telescope oldfiles initial_mode=normal<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>A", ":Telescope myles<cr>", opts)
vim.keymap.set("n", "<leader>H", ":Telescope hg diff<cr>", opts)
vim.keymap.set("n", "<leader>z", ":Telescope biggrep s<cr>", opts)
vim.keymap.set("n", "<leader>/", ":Telescope search_history initial_mode=normal<cr>", opts)
vim.keymap.set("n", "gr", ':Telescope lsp_references {file_ignore_patterns={"test"}} initial_mode=normal<cr>', {noremap = true, silent = true, remap = false, buffer = true})

vim.keymap.set("n", "<leader>po", ":GetCodehubLink<cr>", opts)
vim.keymap.set("v", "<leader>po", ":GetCodehubLink<cr>", opts)
vim.keymap.set("n", "<leader>yf", ":lua vim.fn.setreg('+', vim.fn.expand('%:p'))<cr>", opts)
vim.keymap.set("n", "<leader>yf", ":lua vim.fn.setreg('+', vim.fn.expand('%:p'))<cr>", opts)
vim.keymap.set("n", "<leader>yd", ":lua vim.fn.setreg('+', vim.fn.expand('%:p:h'))<cr>", opts)
vim.keymap.set("n", "<leader>yd", ":lua vim.fn.setreg('+', vim.fn.expand('%:p:h'))<cr>", opts)

vim.keymap.set("n", "<leader>bt", ":lua vim.fn.setreg('+', vim.fn.expand('%:p:h') .. ':' .. vim.fn.expand('<cword>'))<cr>", opts)
vim.keymap.set("v", "<leader>bt", ":lua vim.fn.setreg('+', vim.fn.expand('%:p:h') .. ':' .. vim.fn.expand('<cword>'))<cr>", opts)

vim.keymap.set("n", "<leader>yc", ":GetCodehubLinkYank<cr>")
vim.keymap.set("v", "<leader>yc", ":GetCodehubLinkYank<cr>")

vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<C-\\>", ":aboveleft split<CR>:lua vim.lsp.buf.definition()<CR>", opts)

vim.keymap.set("n", "y", '"+y', opts)
vim.keymap.set("v", "y", '"+y', opts)
vim.keymap.set("n", "Y", '"+Y', opts)
vim.keymap.set("v", "Y", '"+Y', opts)


-- vim.keymap.set(
--   "n",
--   "<C-]>",
--   function()
--     require("telescope.builtin").lsp_definitions({
--       reuse_win = true,
--     })
--   end
-- )

vim.keymap.set("n", "<leader>E", function()
	require("telescope.builtin").find_files({
		cwd = require("telescope.utils").buffer_dir(),
		initial_mode = "normal",
	})
end)

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)

-- diff merge
map("n", "@o", "ddk/=======<cr>d/>>>>>>><cr>dd/<<<<<<<<cr>", { noremap = true })
map("n", "@t", "d/=======<cr>dd/>>>>>>><cr>dd/<<<<<<<<cr>", { noremap = true })

vim.keymap.set("n", "<leader>B", ":OpenBuildFile<cr>")
-- Function to detect the VCS (Git or Mercurial) of the current file
local function detect_vcs()
	local git_cmd = "git rev-parse --is-inside-work-tree 2>/dev/null"
	local hg_cmd = "hg root 2>/dev/null"

	-- Check if the file is in a Git repository
	if vim.fn.system(git_cmd):find("true") then
		return "git"
	end

	-- Check if the file is in a Mercurial repository
	if vim.fn.system(hg_cmd) ~= "" then
		return "hg"
	end

	return nil
end

local function blame()
	local vcs = detect_vcs()
	if vcs == "git" then
		vim.cmd("Git blame") -- Git blame
	elseif vcs == "hg" then
		vim.cmd("HgBlame") -- Replace 'HgBlame' with your Mercurial blame command
	else
		print("Not in a Git or Hg repository")
	end
end

local function file_exists(file_path)
	local file = io.open(file_path, "r")
	if file then
		file:close()
		return true
	else
		return false
	end
end

local function vcs_diff()
	local vcs = detect_vcs()
	if vcs == "git" then
		vim.cmd("Gvdiffsplit")
	elseif vcs == "hg" then
		vim.cmd("Hgvdiff")
	else
		print("Not in a Git or Hg repository")
	end
end

-- Map the blame function to a keybinding (e.g., <leader>b)
vim.keymap.set("n", "<leader>l", blame, { desc = "Blame for the current file" })
vim.keymap.set("n", "<leader>v", vcs_diff, { desc = "diff for the current file" })
vim.keymap.set("n", "<leader>V", ":Hgvdiff .^<cr>", opts)

function open_cf_file(prefix)
	-- Get the current visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])

	-- Extract the selected text
	if #lines > 0 then
		lines[1] = string.sub(lines[1], start_pos[3], -1)
		lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
	end
	local selected_text = table.concat(lines, "\n")
  selected_text = string.match(selected_text, '"(.-)"')
	local extensions = { "cinc", "cconf" }
	for _, ext in ipairs(extensions) do
		local file_path = prefix .. selected_text .. "." .. ext
		local expanded_file_path = vim.fn.expand(file_path)
		if file_exists(expanded_file_path) then
			vim.cmd("edit " .. expanded_file_path)
			return
		end
	end

	print("Configerator file does not exist: " .. selected_text)
end

-- Map a key to call the function
vim.keymap.set("v", "<leader>cf", ":lua open_cf_file('~/configerator/source/')<CR>", { noremap = true, silent = true })
