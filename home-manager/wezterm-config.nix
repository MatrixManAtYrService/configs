{ pkgs, inputs, ... }:
let
  unicodeValues = import ./unicode-values.nix;
  nushell = (import ./nushell.nix { inherit pkgs inputs; }).programs.nushell.package;

  weztermConfig = pkgs.substituteAll {
    src = ./config/wezterm/wezterm.lua;
    nushell = nushell;
    zellij = pkgs.zellij;
    ctrl_shift_left = unicodeValues.ctrl_shift_left.escape;
    ctrl_shift_right = unicodeValues.ctrl_shift_right.escape;
    ctrl_shift_up = unicodeValues.ctrl_shift_up.escape;
    ctrl_shift_down = unicodeValues.ctrl_shift_down.escape;
    ctrl_shift_minus = unicodeValues.ctrl_shift_minus.escape;
    ctrl_shift_plus = unicodeValues.ctrl_shift_plus.escape;
    ctrl_shift_p = unicodeValues.ctrl_shift_p.escape;
    ctrl_shift_m = unicodeValues.ctrl_shift_m.escape;
    ctrl_shift_t = unicodeValues.ctrl_shift_t.escape;
    ctrl_shift_s = unicodeValues.ctrl_shift_s.escape;
    ctrl_shift_c = unicodeValues.ctrl_shift_c.escape;
    ctrl_shift_f = unicodeValues.ctrl_shift_f.escape;
    ctrl_shift_b = unicodeValues.ctrl_shift_b.escape;
    ctrl_shift_o = unicodeValues.ctrl_shift_o.escape;
    ctrl_shift_q = unicodeValues.ctrl_shift_q.escape;
    ctrl_shift_r = unicodeValues.ctrl_shift_r.escape;
    alt_shift_n = unicodeValues.alt_shift_n.escape;
    alt_shift_i = unicodeValues.alt_shift_i.escape;
    alt_shift_o = unicodeValues.alt_shift_o.escape;
    alt_shift_h = unicodeValues.alt_shift_h.escape;
    alt_shift_l = unicodeValues.alt_shift_l.escape;
    alt_shift_left = unicodeValues.alt_shift_left.escape;
    alt_shift_right = unicodeValues.alt_shift_right.escape;
    alt_shift_j = unicodeValues.alt_shift_j.escape;
    alt_shift_down = unicodeValues.alt_shift_down.escape;
    alt_shift_k = unicodeValues.alt_shift_k.escape;
    alt_shift_up = unicodeValues.alt_shift_up.escape;
    alt_shift_plus = unicodeValues.alt_shift_plus.escape;
    alt_shift_minus = unicodeValues.alt_shift_minus.escape;
    alt_shift_bracket_left = unicodeValues.alt_shift_bracket_left.escape;
    alt_shift_bracket_right = unicodeValues.alt_shift_bracket_right.escape;
  };

in {
  home.file."wezterm-config" = {
    source = weztermConfig;
    target = ".config/wezterm/wezterm.lua";
  };
}
