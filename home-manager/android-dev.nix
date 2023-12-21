{ pkgs, ... }: {

  home = with pkgs; {
    packages = [
      usbutils
    ];
  };

  # this needs to go in configuration.nix
  # users.users.matt.extraGroups = ["adbusers"];
}
