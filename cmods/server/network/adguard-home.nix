{lib, config, pkgs, ...}: {
  services.adguardhome = {
    enable = true;
    package = pkgs.adguardhome;
    host = "0.0.0.0";
    port = 3000;
    mutableSettings = true;
    settings = {
      dns = {
        bind_hosts = [ "192.168.1.3" ];
        port = 53;
      };
    };
  };
}
