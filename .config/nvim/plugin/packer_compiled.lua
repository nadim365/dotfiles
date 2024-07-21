-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/nadimac/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/Users/nadimac/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/Users/nadimac/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/Users/nadimac/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/nadimac/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\31\0\0\6\0\16\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0034\4\4\0005\5\a\0>\5\1\0045\5\b\0>\5\2\0045\5\t\0>\5\3\4=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\vconfig\vfooter\1\f\0\0I                                                                    I                                                                    I                                                                    I                                                                    I   _____       ___                _       __  ___                   I  / __(_)___  / _ \\___ ______  __(_)__   /  |/  /__ ____ ____  ___ _I _\\ \\/ / __/ / ___/ _ `/ __/ |/ / (_-<  / /|_/ / _ `/ _ `/ _ \\/ _ `/I/___/_/\\__/ /_/   \\_,_/_/  |___/_/___/ /_/  /_/\\_,_/\\_, /_//_/\\_,_/ I                                                   /___/            I                                                                    I                                                                    \rpackages\1\0\1\venable\2\rshortcut\1\0\4\vaction\23Telescope dotfiles\ngroup\vNumber\bkey\6d\tdesc\17 dotfiles\1\0\4\vaction\14Telescope\ngroup\19DiagnosticHint\bkey\6a\tdesc\r Apps\1\0\6\tdesc\nFiles\bkey\6f\ticon\t \vaction\25Telescope find_files\ficon_hl\14@variable\ngroup\nLabel\vheader\1\0\4\vfooter\0\vheader\0\rshortcut\0\rpackages\0\1\21\0\0k                                       ,▄▄▄▄▄▄▄▄,_                                    \127                                   ▄▓███▀▀▓██▓▀▀███▓▄                                 }                                ,▓██▀\"  ▓███████  '▀███╥                              {                               ▓██\"    ▓█████████    '▀██                             }                              ██▀ _,╓_ ╟█████████ _,,_ ╙██                            �\1                             ██▌▄██████▓╙██████▀▓██████▌╙██                           �\1                            ╒██╫█████████  ██M ████████████▌                          �\1                            ▐██╟█████████  ██M ╟█████████╫█▌                          �\1                            \"██ ╙████████▄ ██M▄████████▀ ██▌                          y                             ██▌       └▀███████\"       ▐██                           o                              ██▌         ▀███\"        ▄██\"                           m                               ▀██▄        ██M       ,███                             q                                `▀██▄,     ██M    _▄██▀┘                              \127                                   ╙▀███▓▄▄██▄▄▓███▀▀                                 o                                       └╙▀▀▀▀▀▀╙└                                     �\1          _╓▄▄▄   ,▄▄▄▄▄▄▄▄▄,    ,▄▄▄_       ╓▄▄▄      ╓▄▄▄   ,▄▄   ,▄▄▄▄_▄▄▄▄        �\1        ▄███████▓_▐██████████▌╓████████▄ ____╫████▌ ╓███████▓,╫██▄▓███▀████████▄      �\1       ▐██Ñ    ███▐██▄     ▀▀▀██▌    ╟██M ╙████▄_  ▐██Ñ    ╟██▓████▀─ ███`   ╙██▌     �\1       ╙██▄    ▐██▐████▓▄     ██▌_   ▐██N██L ╙▀███▄J██▄    ▐██╠████▄, ███,    ██▌     �\1        ╙██████▐██'╙╙\"▀████▄  '▀█████▐██M███████████╙██████▐██╙╙╙└▀███▓██████▌██▌     \1\0\2\ntheme\nhyper\vconfig\0\nsetup\14dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/nvimdev/dashboard-nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markview.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/markview.nvim",
    url = "https://github.com/OXY2DEV/markview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-android"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/vim-android",
    url = "https://github.com/hsanson/vim-android"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/nadimac/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'dashboard-nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
