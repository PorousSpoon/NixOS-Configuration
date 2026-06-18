{ lib, config, ... }: {
  imports = [
    ./cpp.nix
  ];
  modCpp.enable = true;
}
