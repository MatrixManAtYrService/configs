{ inputs, lib, config, pkgs, ... }: {

  home = with pkgs; {
    packages = [
      # rust  # breaks when you uncomment this
    ];
  };
}
