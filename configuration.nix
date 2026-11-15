{ config, lib, pkgs, ... }:
{
  imports = [ 
    ./hardware-configuration.nix 
    ./cmods/services/manager.nix
    ./cmods/bootloader-kernel.nix
    ./cmods/display.nix
    ./cmods/networking.nix
    ./cmods/sound.nix
    ./cmods/system.nix
    ./cmods/systempackages.nix
    ./cmods/users.nix
    ./cmods/keyboard.nix
  ];
}
