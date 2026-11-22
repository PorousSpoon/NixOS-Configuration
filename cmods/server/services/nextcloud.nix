{lib, config, ...}: {
  services.nextcloud = {
    enable = true;
    hostName = "cloud.home.microcloud.co.in";
    datadir = "/mnt/server/nextcloud";
    https = true;
    maxUploadSize = "16G";
    config = {
      adminpassFile = config.sops.secrets."nextcloud_admin_password".path;
      dbtype = "pgsql";

    };
    database.createLocally = true;

    settings = {
      maintenance_window_start = 2;
      trusted_proxies = [ "127.0.0.1" ];
      forwarded_for_headers = [ "HTTP_X_FORWARDED_FOR" ];
      overwriteprotocol = "https";
      default_phone_region = "IN";
    };
    appstoreEnable = false;
    phpOptions."opcache.interned_strings_buffer" = "16";
  };

  # sops
  sops.secrets."nextcloud_admin_password" = {};
}
