{ inputs, lib, config, pkgs, ... }: {

  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
      kind
      gnumake
      docker
      docker-compose
      sops
      go-swag
    ];
  };

  programs = {
    k9s.enable = true;
    nushell = {
      extraEnv = ''
        $env.PATH = ($env.PATH | split row (char esep) | append '/usr/local/bin')
      ''; 
    }; 
    go = {
      enable = true;
      packages = {
        "time" = pkgs.fetchFromGitHub {
          owner = "golang";
          repo = "time";
          rev = "v0.5.0";
          sha256 = "sha256-W6RgwgdYTO3byIPOFxrP2IpAZdgaGowAaVfYby7AULU=";
        };
      };
    };  
  };
}
