{ inputs, lib, config, pkgs, ... }: {

  home = with pkgs; {
    packages = [
      clippy
      rustc
      cargo
      rustfmt
      rust-analyzer
    ];
  };
}
