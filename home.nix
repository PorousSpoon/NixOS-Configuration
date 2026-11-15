{ config, pkgs, ... }: {
  imports = [
    ./hmods/display/themes.nix
    ./hmods/programs/manager.nix 
    ./hmods/hm/home-manager-specifications.nix
    ./hmods/hm/packages.nix
  ];
}
