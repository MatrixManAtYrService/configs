{ pkgs, ... }:
let
  weztermConfig = pkgs.substituteAll {
    src = ./config/wezterm/wezterm.lua;
    nushell = pkgs.nushell;
    zellij = pkgs.zellij;
  };

in {
  home.file."wezterm-config" = {
    source = weztermConfig;
    target = ".config/wezterm/wezterm.lua";
  };
}

