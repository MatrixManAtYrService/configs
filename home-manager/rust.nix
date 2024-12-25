{  pkgs, ... }: {
  home = {
    packages = with pkgs; [
      rustc
      cargo
    ];
    file."cargo-config" = {
        source = ./config/cargo.toml;
        target = ".cargo/config.toml";
      };
  };
}
