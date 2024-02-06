local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.default_prog = { '@nushell@/bin/nu' }

return config
