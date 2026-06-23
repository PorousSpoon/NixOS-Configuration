{ pkgs, lib, config, ...}: {
  home.packages = with pkgs; [
      jetbrains-mono
  ];
}
