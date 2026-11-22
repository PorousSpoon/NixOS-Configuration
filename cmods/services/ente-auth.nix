{lib, config, pkgs, ...}: {
  options.modEnte-Auth.enable = lib.mkEnableOption "Enables the ente-auth.nix module";
  config = lib.mkIf config.modEnte-Auth.enable {
    programs.ente-auth = {
      enable = true;
      package = pkgs.ente-auth;
    };

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;
  };
}
