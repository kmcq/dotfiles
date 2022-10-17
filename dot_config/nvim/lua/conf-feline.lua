local lsp = require "feline.providers.lsp"
local vi_mode_utils = require "feline.providers.vi_mode"

local lsp_get_diag = function(str)
  local diagnostics = vim.diagnostic.get(0, { severity = str })
  local count = #diagnostics
  return (count > 0) and " " .. count .. " " or ""
end

local comps = {
  vi_mode = {
    left = {
      provider = function()
        return " " .. vi_mode_utils.get_vim_mode()
      end,
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color()
          -- fg = colors.bg
        }
        return val
      end,
      right_sep = " "
    },
    right = {
      -- provider = '▊',
      provider = "",
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color()
        }
        return val
      end,
      left_sep = " ",
      right_sep = " "
    }
  },
  file = {
    info = {
      provider = {
        name = "file_info",
        opts = {
          type = "relative",
        }
      },
      hl = {
        style = "bold"
      }
    },
    encoding = {
      provider = "file_encoding",
      left_sep = " ",
      hl = {
        style = "bold"
      }
    },
    type = {
      provider = "file_type"
    },
    position = {
      provider = "position",
      left_sep = " ",
      hl = {
        -- style = 'bold'
      }
    }
  },
  left_end = {
    provider = function()
      return ""
    end,
  },
  line_percentage = {
    provider = "line_percentage",
    left_sep = " ",
    hl = {
      style = "bold"
    }
  },
  scroll_bar = {
    provider = "scroll_bar",
    left_sep = " ",
    hl = {
      style = "bold"
    }
  },
  diagnos = {
    err = {
      -- provider = 'diagnostic_errors',
      provider = function()
        return lsp_get_diag("Error")
      end,
      -- left_sep = ' ',
      enabled = function()
        return lsp.diagnostics_exist("Error")
      end,
    },
    warn = {
      provider = function()
        return lsp_get_diag("Warn")
      end,
      enabled = function()
        return lsp.diagnostics_exist("Warn")
      end,
    },
    info = {
      provider = function()
        return lsp_get_diag("Info")
      end,
      enabled = function()
        return lsp.diagnostics_exist("Info")
      end,
    },
    hint = {
      provider = function()
        return lsp_get_diag("Hint")
      end,
      enabled = function()
        return lsp.diagnostics_exist("Hint")
      end,
    }
  },
  lsp = {
    name = {
      provider = "lsp_client_names",
      left_sep = " ",
      icon = " ",
      right_sep = " ",
    }
  },
  git = {
    branch = {
      provider = "git_branch",
      right_sep = " ",
      icon = " ",
      left_sep = " ",
      hl = {
        style = "bold"
      }
    },
    add = {
      provider = "git_diff_added",
    },
    change = {
      provider = "git_diff_changed",
      icon = " ",
    },
    remove = {
      provider = "git_diff_removed",
    }
  }
}

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[3], comps.diagnos.err)
table.insert(components.active[3], comps.diagnos.warn)
table.insert(components.active[3], comps.diagnos.hint)
table.insert(components.active[3], comps.diagnos.info)
table.insert(components.active[3], comps.lsp.name)
table.insert(components.active[3], comps.file.os)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)
table.insert(components.active[3], comps.vi_mode.right)

require("feline").setup(
  {
    components = components,
    force_inactive = {
      filetypes = {
        "packer",
        "NvimTree",
        "fugitive",
        "fugitiveblame"
      },
      buftypes = { "terminal" },
      bufnames = {}
    }
  }
)
