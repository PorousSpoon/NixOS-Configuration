{lib, config, ...}: {
  imports = [
    # Services
    ./services/vaultwarden.nix
    ./services/immich.nix
    ./services/restic.nix
    ./services/nextcloud.nix

    # Network
    ./network/adguard-home.nix

    # Server
    ./storage.nix
    ./caddy.nix
  ];

  networking.hosts = {
    "192.168.0.152" = [ 
      "vaultwarden.home.microcloud.co.in"
      "immich.home.microcloud.co.in"
      "cloud.home.microcloud.co.in"
    ];
  };
}
