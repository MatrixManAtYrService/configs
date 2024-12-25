local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.set_environment_variables = {
  SHELL = '@nushell@/bin/nu'
}
config.default_prog = { '@zellij@/bin/zellij', '--debug', '-l', 'compact'}

config.keys = {
  {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_left@")},
  {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_right@")},
  {key="UpArrow", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_up@")},
  {key="DownArrow", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_down@")},
  {key="-", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_minus@")},
  {key="=", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_plus@")},
  {key="p", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_p@")},
  {key="m", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_m@")},
  {key="t", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_t@")},
  {key="s", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_s@")},
  {key="c", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_c@")},
  {key="f", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_f@")},
  {key="b", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_b@")},
  {key="o", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_o@")},
  {key="q", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_q@")},
  {key="r", mods="CTRL|SHIFT", action=wezterm.action.SendString("@ctrl_shift_r@")},
  {key="n", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_n@")},
  {key="i", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_i@")},
  {key="o", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_o@")},
  {key="h", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_h@")},
  {key="LeftArrow", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_left@")},
  {key="RightArrow", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_right@")},
  {key="j", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_j@")},
  {key="l", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_l@")},
  {key="DownArrow", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_down@")},
  {key="k", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_k@")},
  {key="UpArrow", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_up@")},
  {key="=", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_plus@")},
  {key="-", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_minus@")},
  {key="[", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_bracket_left@")},
  {key="]", mods="ALT|SHIFT", action=wezterm.action.SendString("@alt_shift_bracket_right@")},
}

return config
