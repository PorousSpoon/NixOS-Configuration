{ ... }: {
  networking.hostName = "nixos-gigabyte";
  networking.networkmanager.enable = true;
  # Below attribute is necessary for KDE Connect
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedTCPPorts = [ 8384 ];

    allowedUDPPortRanges = allowedTCPPortRanges;
    allowedUDPPorts = allowedTCPPorts;
  };
}
