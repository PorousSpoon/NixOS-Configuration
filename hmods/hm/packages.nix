{ pkgs, lib, config, ...}: {
  home.packages = with pkgs; [
      jetbrains-mono
      yt-dlp
      ffmpeg
      strawberry
      obsidian
      kitty-themes
      viu
  ];
  nixpkgs.config.allowUnfree = true;
}
