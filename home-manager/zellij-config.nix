{ pkgs, ... }:
let
  unicodeValues = import ./unicode-values.nix;
  zellijConfig = pkgs.substituteAll {
    src = ./config/zellij/config.kdl;
    ctrl_shift_left = unicodeValues.ctrl_shift_left.literal;
    ctrl_shift_right = unicodeValues.ctrl_shift_right.literal;
    ctrl_shift_up = unicodeValues.ctrl_shift_up.literal;
    ctrl_shift_down = unicodeValues.ctrl_shift_down.literal;
    ctrl_shift_minus = unicodeValues.ctrl_shift_minus.literal;
    ctrl_shift_plus = unicodeValues.ctrl_shift_plus.literal;
    ctrl_shift_p = unicodeValues.ctrl_shift_p.literal;
    ctrl_shift_h = unicodeValues.ctrl_shift_h.literal;
    ctrl_shift_t = unicodeValues.ctrl_shift_t.literal;
    ctrl_shift_s = unicodeValues.ctrl_shift_s.literal;
    ctrl_shift_c = unicodeValues.ctrl_shift_c.literal;
    ctrl_shift_f = unicodeValues.ctrl_shift_f.literal;
    ctrl_shift_b = unicodeValues.ctrl_shift_b.literal;
    ctrl_shift_o = unicodeValues.ctrl_shift_o.literal;
    ctrl_shift_q = unicodeValues.ctrl_shift_q.literal;
    ctrl_shift_r = unicodeValues.ctrl_shift_r.literal;
    alt_shift_n = unicodeValues.alt_shift_n.literal;
    alt_shift_i = unicodeValues.alt_shift_i.literal;
    alt_shift_o = unicodeValues.alt_shift_o.literal;
    alt_shift_h = unicodeValues.alt_shift_h.literal;
    alt_shift_l = unicodeValues.alt_shift_l.literal;
    alt_shift_left = unicodeValues.alt_shift_left.literal;
    alt_shift_right = unicodeValues.alt_shift_right.literal;
    alt_shift_j = unicodeValues.alt_shift_j.literal;
    alt_shift_down = unicodeValues.alt_shift_down.literal;
    alt_shift_k = unicodeValues.alt_shift_k.literal;
    alt_shift_up = unicodeValues.alt_shift_up.literal;
    alt_shift_plus = unicodeValues.alt_shift_plus.literal;
    alt_shift_minus = unicodeValues.alt_shift_minus.literal;
    alt_shift_bracket_left = unicodeValues.alt_shift_bracket_left.literal;
    alt_shift_bracket_right = unicodeValues.alt_shift_bracket_right.literal;
  };

in {
  home.file."zellij-config" = {
    source = zellijConfig;
    target = ".config/zellij/config.kdl";
  };
}
