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
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.go" },
  {
    "ray-x/go.nvim",
    -- don't install go binaries with the plugin
    -- instead we install these with nix: https://github.com/ray-x/go.nvim#go-binaries-install-and-update
    build = "true",
  },

  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },

  {
    "marcinjahn/gemini-cli.nvim",
    cmd = "Gemini",
    -- Example key mappings for common actions:
    keys = {
      { "<leader>a/", "<cmd>Gemini toggle<cr>", desc = "Toggle Gemini CLI" },
      { "<leader>aa", "<cmd>Gemini ask<cr>", desc = "Ask Gemini", mode = { "n", "v" } },
      { "<leader>af", "<cmd>Gemini add_file<cr>", desc = "Add File" },
    },
    dependencies = {
      "folke/snacks.nvim",
    },
    config = true,
  },
  -- terminal integration
  --lua/astrocommunity/terminal-integration/vim-tmux-navigator/README.md
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
}
