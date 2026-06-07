{ config, pkgs, ... }:

{
  imports = [ ./modules/xsession-i3.nix ./modules/programs/MANAGER.nix ];
  home.username = "north";
  home.homeDirectory = "/home/north";
  home.stateVersion = "26.05";
  home = {
    packages = with pkgs; [
      feh
      rofi
      pavucontrol
      networkmanagerapplet
      grim
      slurp
      wl-clipboard
    ];
    pointerCursor = {
      enable = true;
      size = 40;
      package = pkgs.capitaine-cursors;
      name = "Capitaine-Cursors";
    };
  };
}
