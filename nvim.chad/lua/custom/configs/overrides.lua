local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "prettier",

    -- python
    "pyright",
    "black",

    -- rust
    "rust-analyzer",
    "rustfmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  auto_reload_on_write = true,
  git = {
    enable = true,
    ignore = false,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    highlight_git = true,
    full_name = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  modified = {
    enable = true,
  },

  view = {
    preserve_window_proportions = true,
  },
}

M.cmp = {
  completion = {
    completeopt = "menu,menuone,noselect",
  },
}

M.copilot = {
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M
