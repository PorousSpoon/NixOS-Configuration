{ pkgs, lib, config, ... }: {
  options.modCpp.enable = lib.mkEnableOption "Enables the C++ module";
  config = lib.mkIf config.modCpp.enable {
    environment.systemPackages = with pkgs; [
      devenv
      gcc
      gnumake
    ];
  };
}
