# Do not modify this file!  It was generated by ‘nixos-generate-config’ and may be overwritten by future invocations.  Please make changes to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{ imports = [ ];

  boot.initrd.availableKernelModules = [ "virtio_pci" ]; boot.initrd.kernelModules = [ ]; boot.kernelModules = [ ]; boot.extraModulePackages = [ ];

  fileSystems."/" = { device = "/dev/disk/by-uuid/f7a4194d-5a68-4278-8d37-4dd6ab8ffb59";
      fsType = "ext4";
    };

  fileSystems."/usr/lib/wsl/drivers" = { device = "none";
      fsType = "9p";
    };

  fileSystems."/usr/lib/wsl/lib" = { device = "none";
      fsType = "overlay";
    };

  fileSystems."/mnt/wsl" = { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/mnt/c" = { device = "drvfs";
      fsType = "9p";
    };

  swapDevices = [ { device = "/dev/disk/by-uuid/d7f9e96f-b826-47a6-b71d-ef06ec3ffa52"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking (the default) this is the recommended approach. When using systemd-networkd it's still possible to use this option, but it's recommended to use it in conjunction with explicit 
  # per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.bonding_masters.useDHCP = lib.mkDefault true; networking.interfaces.eth0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

