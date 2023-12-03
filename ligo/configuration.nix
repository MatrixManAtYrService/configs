{ pkgs, lib, self, ... }:
{

  nix = {
    settings.experimental-features = "nix-command flakes";
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.system = "x86_64-darwin";

  system = {
    stateVersion = 4;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  environment.systemPackages = [
  ];


  # these work in NixOS but not on nix-darwin
  # programs.nushell.enable = true;
  # programs.home-manager.enable = true;

  programs.zsh.enable = true;

  users.users.matt = {
      home = /Users/matt;
      shell = pkgs.nushell;
    };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;


  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

}
