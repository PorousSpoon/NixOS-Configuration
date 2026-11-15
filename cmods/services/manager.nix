{lib, config, ...}: {
  imports = [
    ./flatpak.nix
    ./development.nix
    ./virtualisation.nix
    ./portmaster.nix
  ];
  modFlatpak.enable = true;
  modDevelopment.enable = true;
  modVirtualisation.enable = true;
  modPortmaster.enable = true;
}
