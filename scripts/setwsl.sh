sudo nixos-rebuild switch --flake .#wsl --impure
home-manager switch --flake .#nixos@nixos --show-trace
