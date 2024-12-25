{ pkgs, ... }: 

{

  home = with pkgs; {
    stateVersion = "23.05";
    packages = [
      python311Packages.ipython
      poetry
    ];


  file.".ipython/profile_default/ipython_config.py".text = 
    ''
    c.TerminalInteractiveShell.editing_mode = 'vi'
    '';
  };

  programs = {
    helix = {
      enable = true;
    };
  };
}
