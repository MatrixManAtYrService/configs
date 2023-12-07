{ inputs, lib, config, pkgs, ... }: {

  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
    ];
  };

  programs.k9s.enable = true;
}
