{ config, lib, pkgs, ... }:
{
  imports = [ 
    ./hardware-configuration.nix 
    ./cmodules/MANAGER.nix
    ./cmodules/bootloader-kernel.nix
    ./cmodules/display.nix
    ./cmodules/networking.nix
    ./cmodules/sound.nix
    ./cmodules/system.nix
    ./cmodules/systempackages.nix
    ./cmodules/users.nix
    ./cmodules/virtualisation.nix
  ];
}
