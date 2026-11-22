{lib, config, pkgs, inputs, ...}: 
let 
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  services.immich = {
    enable = true;
    package = pkgs-unstable.immich;
    mediaLocation = "/mnt/server/immich";
    port = 2283;
    host = "127.0.0.1";
    machine-learning.enable = true;
  };
}
