{lib, config, ...}: {
  imports = [
    ./flatpak.nix
    ./development.nix
    ./virtualisation.nix
    ./portmaster.nix
    ./ente-auth.nix
    ./syncthing.nix
    ./atuin.nix
  ];
  modFlatpak.enable = true;
  modDevelopment.enable = true;
  modVirtualisation.enable = true;
  modPortmaster.enable = true;
  modEnte-Auth.enable = true;
  modSyncthing.enable = true;
  modAtuin.enable = true;
}
