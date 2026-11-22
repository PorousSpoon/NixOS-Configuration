{lib, config, pkgs, ...}: {
  services.vaultwarden = {
    enable = true;
    package = pkgs.vaultwarden-sqlite;
    dbBackend = "sqlite";
    environmentFile = config.sops.templates."vaultwarden.env".path;
    domain = "vaultwarden.home.microcloud.co.in";
    config = {
      SIGNUPS_ALLOWED = true;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      DATA_FOLDER = "/mnt/server/vaultwarden";
    };
  };

    # sops
    sops = {
      secrets."vaultwarden_admin_token" = {};
      templates."vaultwarden.env" = {
        content = ''
          ADMIN_TOKEN=${config.sops.placeholder."vaultwarden_admin_token"}
        '';
        restartUnits = [ "vaultwarden.service" ];
      };
    };
    systemd.services.vaultwarden.serviceConfig.ReadWritePaths = [ "/mnt/server/vaultwarden" ];
  }
