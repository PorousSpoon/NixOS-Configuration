{ config, pkgs, ... }:

{
  imports = [ ./modules/xsession-i3.nix ];
  home.username = "north";
  home.homeDirectory = "/home/north";
  programs.git = {
    enable = true;
    settings.user.name = "north";
    settings.user.email = "north@nixos-hp-spectre";
  };
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    initExtra = ''
        PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
    '';
  };
  programs.vim = {
    enable = true;
    extraConfig = ''
        colorscheme habamax
        set tabstop=4
        set shiftwidth=4
        set number
        set relativenumber
        syntax on
        set expandtab
        set autoindent
    '';
  };
  programs.kitty = {
    enable = true;
    font = {
      name  = "JetBrains Mono";
      size = 12;
    };
    settings = {
      enable_audio_bell = true;
    };
    themeFile = "Carbonfox";
  };
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
