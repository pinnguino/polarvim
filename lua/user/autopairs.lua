local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("ERROR: autopairs not loaded!")
  return
end

npairs.setup {
  ts_config = {
    lua = { "string", "source" },
  },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)