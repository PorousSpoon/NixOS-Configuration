{ config, pkgs, ... }:

{
  imports = [ 
    ./hmodules/programs/MANAGER.nix 
    ./hmodules/home-manager-specifications.nix
  ];
}
