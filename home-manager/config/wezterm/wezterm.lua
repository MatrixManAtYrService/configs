local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.hide_tab_bar_if_only_one_tab = true


config.default_prog = { '@nushell@/bin/nu', '-c', '@zellij@/bin/zellij -l welcome' }

return config
