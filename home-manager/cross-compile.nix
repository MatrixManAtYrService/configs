{  pkgs, ... }: {
  home = {
    packages = with pkgs; [
      gcc-arm-embedded
      pkgsCross.aarch64-multiplatform.buildPackages.gcc
    ];
  };
}
