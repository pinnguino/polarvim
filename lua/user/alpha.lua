local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local time = os.date("%H:%M")
local v = vim.version()
local version = " version " .. v.major .. "." .. v.minor .. "." .. v.patch
local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1)) .. "  plugins in total"
local date = os.date("Today is %a %d %b")

dashboard.section.header.val = {
    "                                                      ",
    "   ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ",
    "   ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ",
    "  ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ",
    "  ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ",
    "  ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ",
    "  ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
    "  ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ",
    "     ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ",
    "           ░    ░  ░    ░ ░        ░   ░         ░    ",
    "                                  ░                   ",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New File    ", ":enew<CR>"),
  dashboard.button("f", "  Find File   ", ":Telescope file_browser<CR>"),
  dashboard.button("s", "  Load last session        ", ":source ~/.config/nvim/lastsession.vim<CR>"),
  dashboard.button("r", "󰁫  Recent files   ", ":Telescope oldfiles<CR>"),
  dashboard.button("p", "  Projects ", ":Telescope projects<CR>"),
}

dashboard.section.footer.val = {
  "╭╴    " .. version .. "    ╶╮",
  "│   " .. plugins_count ..  "  │",
  "╰╴  " .. date .. "  ╶╯"

}

alpha.setup(dashboard.opts)
