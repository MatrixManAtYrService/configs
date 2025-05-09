{ pkgs, ... }: 

{

  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
      nodejs_23
    ];
  };
}
