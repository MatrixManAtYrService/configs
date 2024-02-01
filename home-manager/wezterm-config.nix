{ pkgs, ... }: 
let
  weztermConfigScript = pkgs.writeShellScript "wezterm-config-script" ''
    sed "s|@nushell@|${pkgs.nushell}|g" ${./config/wezterm/wezterm.lua} > $out
  '';

  weztermConfig = pkgs.runCommand "wezterm-config" {} ''
    sh ${weztermConfigScript} > $out
  '';
in {
  home.file."wezterm-config" = {
    source = weztermConfig;
    target = ".config/wezterm/wezterm.lua";
  };
}


