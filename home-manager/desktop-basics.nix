{ inputs, lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
      wezterm
      brave
      _1password-gui
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
