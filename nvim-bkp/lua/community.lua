-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.recipes.telescope-nvim-snacks" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.scrolling.mini-animate" },

  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  -- terminal integration
  --lua/astrocommunity/terminal-integration/vim-tmux-navigator/README.md
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  lsp = {
    formatting = {
      timeout_ms = 3200,
    },
  },
}
