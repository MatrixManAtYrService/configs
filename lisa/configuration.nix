{ pkgs, lib, self, ... }:
{

  nix = {
    settings.experimental-features = "nix-command flakes";
    extraOptions = ''
#      auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.system = "aarch64-darwin";

  system = {
    stateVersion = 4;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  environment.systemPackages = [
  ];

  networking = {
    hostName = "LISA";
  };


  programs.zsh.enable = true;

  users.users.matt = {
      home = /Users/matt;
      shell = pkgs.nushell;
  };

  services.nix-daemon.enable = true;


  security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    enable = true;
    casks  = [
      "wezterm"
    ];
  };

}