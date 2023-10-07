{ inputs, lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
      xclip
      wezterm
      keyd
    ];
  home.file = {
    ".config/wezterm/wezterm.lua".text = ''
    -- Pull in the wezterm API
    local wezterm = require 'wezterm'
    local config = {}

    -- In newer versions of wezterm, use the config_builder which will
    -- help provide clearer error messages
    if wezterm.config_builder then
      config = wezterm.config_builder()
    end

    config.color_scheme = 'Monokai (base16)'
    config.hide_mouse_cursor_when_typing = false

    config.keys = {
      {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Down',
      },
      {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Up',
      },
      {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Left',
      },
      {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Right',
      },
      {
        key = 'b',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.RotatePanes 'CounterClockwise',
      },
      {
        key = 'n',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.RotatePanes 'Clockwise',
      }
    }

    config.hyperlink_rules = {
      -- Matches: a URL in parens: (URL)
      {
        regex = '\\((\\w+://\\S+)\\)',
        format = '$1',
        highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
        regex = '\\[(\\w+://\\S+)\\]',
        format = '$1',
        highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
        regex = '\\{(\\w+://\\S+)\\}',
        format = '$1',
        highlight = 1,
      },
      -- Matches: a URL in angle brackets: <URL>
      {
        regex = '<(\\w+://\\S+)>',
        format = '$1',
        highlight = 1,
      },
      -- Then handle URLs not wrapped in brackets
      {
        regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
        format = '$0',
      }
    }


    return config

    '';
  };
}
