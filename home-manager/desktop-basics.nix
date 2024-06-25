{ pkgs, ... }: {

  home.packages = with pkgs; [
      wezterm
      brave
      _1password-gui
    ];
}
