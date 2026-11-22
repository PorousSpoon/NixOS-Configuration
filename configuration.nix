{ config, lib, pkgs, ... }:
{
  imports = [ 
    ./hardware-configuration.nix 

    ./cmods/bootloader-kernel.nix
    ./cmods/display.nix
    ./cmods/networking.nix
    ./cmods/sound.nix
    ./cmods/system.nix
    ./cmods/systempackages.nix
    ./cmods/users.nix
    ./cmods/keyboard.nix
    ./cmods/secrets.nix

    # User services
    ./cmods/services/manager.nix

    # Server
    ./cmods/server/server.nix
  ];
}
