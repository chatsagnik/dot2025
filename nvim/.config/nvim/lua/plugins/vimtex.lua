return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Viewer settings
    vim.g.vimtex_view_method = 'zathura_simple'    -- For Wayland compatibility, avoid xdotool
    vim.g.vimtex_context_pdf_viewer = 'okular'     -- External PDF viewer for the Vimtex menu

    -- Suppression settings
    vim.g.vimtex_quickfix_mode = 0                 -- Suppress quickfix on save/build
    vim.g.vimtex_log_ignore = {                    -- Suppress specific log messages
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    }

    -- Other settings
    vim.g.tex_flavor = 'latex'                     -- Set file type for TeX files

  end,
}
