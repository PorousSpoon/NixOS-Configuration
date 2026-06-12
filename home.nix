{ config, pkgs, ... }:

{
  imports = [ 
    ./modules/programs/MANAGER.nix 
    ./modules/hyprland/MANAGER.nix
    ./modules/waybar/MANAGER.nix
  ];
  home.username = "north";
  home.homeDirectory = "/home/north";
  home.stateVersion = "26.05";
}
