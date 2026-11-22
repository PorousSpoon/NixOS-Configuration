{ ... }: {
  networking.hostName = "nixos-gigabyte";
  networking.networkmanager.enable = true;
  # Below attribute is necessary for KDE Connect
  networking.firewall = rec {
    allowedTCPPorts = [ 8384 ];
    allowedUDPPorts = allowedTCPPorts;
  };
}
