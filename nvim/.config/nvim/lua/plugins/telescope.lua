return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-bibtex.nvim",
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "ivy"
        }
      },
      load_extensions = {
        "fzf",
        "bibtex"
      },
      bibtex = {
        context = true,
        context_fallback = true, -- If local bib file not found, go to global bib file
        global_files = {"~/Documents/Library/texmf/bibtex/bib/zotero.bib"},
        wrap = true,
        depth = 1, -- depth to search for local bib file
      }
    }
    vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
  end
}
