# Dump GUI-configured dconf config to `dconf.nix` like so:
#
#     $ dconf dump / | dconf2nix > dconf.nix
#
# The gnome keyboard shortcuts GUI doesn't support setting the same action to
# more than one hotkey, so that file *overwrites* the default key bindings.
#
# This module adds the defaults back in.  It works because by default, nix
# resolves list conflicts by merging the two.

{ ... }:
{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      maximize = [ "<Super>Up"];
      unmaximize = [ "<Super>Down"];
      switch-to-workspace-left = [ "<Control><Alt>Left" ];
      switch-to-workspace-right = [ "<Control><Alt>Right" ];
      move-to-workspace-left = [ "<Super>Up" ];
      move-to-workspace-right = [ "<Super>Down" ];
    };
    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Super>h" ];
      toggle-tiled-right = [ "<Super>l" ];
    };
  };
}
