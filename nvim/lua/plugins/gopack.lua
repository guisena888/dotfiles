return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = false,
                shadow = false,
                nilness = false,
                unusedwrite = false,
              },
              codelenses = {
                generate = false,
                regenerate_cgo = false,
                test = false,
                tidy = false,
                upgrade_dependency = false,
                vendor = false,
              },
              directoryFilters = { "-vendor", "-testdata", "-.git", "-node_modules" },
              staticcheck = false,
              diagnosticsDelay = "10000ms",
              gofumpt = true,
              matcher = "Fuzzy",
              semanticTokens = true,
              symbolMatcher = "fuzzy",
              usePlaceholders = true,
              buildFlags = { "-tags", "integration" },
              completeUnimported = true,
              -- Optimized timeout settings
              completionBudget = "200ms",
              importShortcut = "Both",
              deepCompletion = false,
              experimentalPostfixCompletions = false,
            },
          },
          -- LSP client timeout settings
          timeout_ms = 10000,
          flags = {
            debounce_text_changes = 150,
          },
        },
      },
      -- Global LSP settings
      on_attach = function(client, bufnr)
        -- Increase timeout for gopls client
        if client.name == "gopls" then client.config.timeout = 10000 end
      end,
    },
  },

  -- Golang Treesitter support
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
      end
    end,
  },

  -- Mason null-ls tools
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "gomodifytags", "iferr", "impl", "gotests", "goimports" }
      )
    end,
  },

  -- Mason LSP config
  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "gopls" })
    end,
  },

  -- Mason tool installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed,
        { "delve", "gopls", "gomodifytags", "gotests", "iferr", "impl", "goimports" }
      )
    end,
  },

  -- DAP Go debugging
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "jay-babu/mason-nvim-dap.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "delve" })
        end,
      },
    },
    opts = {},
  },

  -- Gopher.nvim for Go utilities
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      if not require("lazy.core.config").spec.plugins["mason.nvim"] then
        vim.print "Installing go dependencies..."
        vim.cmd.GoInstallDeps()
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "williamboman/mason.nvim", optional = true },
    },
    opts = {},
  },

  -- Neotest Go testing
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = { "fredrikaverpil/neotest-golang" },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-golang"(require("astrocore").plugin_opts "neotest-golang"))
    end,
  },

  -- Conform.nvim formatting with goimports
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
      },
      format_on_save = {
        timeout_ms = 5000,
        lsp_fallback = true,
      },
      formatters = {
        goimports = {
          timeout_ms = 3000,
        },
      },
    },
  },

  -- Mini.icons for Go file icons
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
  },
}
