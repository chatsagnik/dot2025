local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }


-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local map = vim.keymap.set -- for conciseness

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-------------------- General Keymaps --------------------

-- delete single character without copying into register
-- keymap("n", "x", '"_x', opts)
-- keymap("v", "p", '"_p', opts)

-- Unmappings
keymap("n", "<C-z>", "<nop>", opts)
keymap("n", "gc", "<nop>", opts)
keymap("n", "gcc", "<nop>", opts)

-- NOTE: not sure I will uses these cmp-vimtex commands
-- Search from hovering over cmp-vimtex citation completion
-- vim.keymap.set("i", "<C-z>", function() 
--   require('cmp_vimtex.search').search_menu()
-- end)
-- vim.keymap.set("i", "<C-z>", function() 
--   require('cmp_vimtex.search').perform_search({ engine = "arxiv" })
-- end)

-- NOTE: prefer to use whichkey
-- Surround 
-- vim.keymap.set("v", '<C-s>', 'S', { remap = true }) -- see surround.lua

-- Terminal
vim.keymap.set("n", "<C-t>", "<cmd>Floaterminal<CR>", { remap = true })

-- Spelling
vim.keymap.set("n", "<C-s>", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
      previewer = false,
      layout_config = {
        width = 50,
        height = 15,
      }
    })
  )
end, { remap = true })
-- vim.keymap.set("n", "<C-s>", "z=", { remap = true}) 
-- keymap("n", "<C-s>", "<cmd>Telescope spell_suggest<cr>", { remap = true})

-- Kill search highlights
keymap("n", "<CR>", "<cmd>noh<CR>", opts)


-- Find project files
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", { remap = true })
  -- function ()
  --   require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))
  -- end, 


-- Toggle comments
keymap('n', "<C-;>", '<Plug>(comment_toggle_linewise_current)', opts)
keymap('x', "<C-;>", '<Plug>(comment_toggle_linewise_visual)', opts)


