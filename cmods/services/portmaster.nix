{pkgs, inputs, lib, config, ...}: 
let 
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
  {
    imports = [
      "${inputs.nixpkgs-unstable}/nixos/modules/services/networking/portmaster.nix"
    ];

    options.modPortmaster.enable = lib.mkEnableOption "Configuration for Portmaster firewall service";
    config = lib.mkIf config.modPortmaster.enable {
      services.portmaster = {
        enable = true;
        package = pkgs-unstable.portmaster;
      };
    };
  }
