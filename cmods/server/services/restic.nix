{lib, config, pkgs, ...}: let
  dumpDir = "/mnt/server/dumps";
in {
  services.restic.backups = {
    vaultwarden = {
      repository = "/backup/restic-vaultwarden";
      passwordFile = config.sops.secrets."restic_password".path;
      initialize = true;
      paths = [
        "/mnt/server/vaultwarden"
        dumpDir
      ];
      exclude = [
        "/mnt/server/vaultwarden/db.sqlite3-wal"
        "/mnt/server/vaultwarden/db.sqlite3-shm"
      ];

      backupPrepareCommand = ''
        mkdir -p ${dumpDir}
        ${pkgs.sqlite}/bin/sqlite3 /mnt/server/vaultwarden/db.sqlite3 ".backup '${dumpDir}/vaultwarden-db.sqlite3'"
      '';

      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
      ];

      timerConfig = {
        OnCalendar = "daily";
        RandomizedDelaySec = "1h";
        Persistent = true;
      };
    };

    immich = {
      repository = "/backup/restic-immich";
      passwordFile = config.sops.secrets."restic_password".path;
      initialize = true;
      paths = [
        "/mnt/server/immich"
        dumpDir
      ];

      backupPrepareCommand = ''
        mkdir -p ${dumpDir}
        ${pkgs.util-linux}/bin/runuser -u postgres -- \
          ${pkgs.postgresql}/bin/pg_dump --dbname=immich > ${dumpDir}/immich.sql
      '';

      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
      ];
      timerConfig = {
        OnCalendar = "daily";
        RandomizedDelaySec = "1h";
        Persistent = true;
      };
    };

    nextcloud = {
      repository = "/backup/restic-nextcloud";
      passwordFile = config.sops.secrets."restic_password".path;
      initialize = true;
      paths = [
        "/mnt/server/nextcloud"
        "/var/lib/nextcloud"
        dumpDir
      ];

      backupPrepareCommand = ''
        mkdir -p ${dumpDir}
        ${pkgs.util-linux}/bin/runuser -u postgres -- \
          ${pkgs.postgresql}/bin/pg_dump --dbname=nextcloud > ${dumpDir}/nextcloud.sql
      '';

      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
      ];
      timerConfig = {
        OnCalendar = "daily";
        RandomizedDelaySec = "1h";
        Persistent = true;
      };
    };
  };

  # sops
  sops.secrets."restic_password" = {};
}
