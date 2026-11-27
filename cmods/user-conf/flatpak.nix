{lib, config, ...}: {
  options.modFlatpak.enable = lib.mkEnableOption "Enables flatpak.nix module";
  config = lib.mkIf config.modFlatpak.enable {
    services.flatpak.enable = true;
  };
}
