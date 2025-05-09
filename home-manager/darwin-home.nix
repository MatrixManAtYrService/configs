{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  home = with pkgs; {
      stateVersion = "23.05";
    username = "matt";
    packages = [ tree ];
  };
}
