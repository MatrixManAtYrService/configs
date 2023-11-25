{ inputs, lib, config, pkgs, ... }: {

 
  home = with pkgs; {
    packages = [
      wl-clipboard
    ];
  };
}
