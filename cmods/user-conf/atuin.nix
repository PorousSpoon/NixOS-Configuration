{lib, config, pkgs, ...}: {
  options.modAtuin.enable = lib.mkEnableOption "Configuration for Atuin";
  config = lib.mkIf config.modAtuin.enable {
    programs.atuin = {
      enable = true;
      package = pkgs.atuin;
      enableFishIntegration = true;
      daemon.enable = true;
      flags = [
        "--disable-up-arrow"
      ];
      settings = builtins.fromTOML (builtins.readFile ./atuin.toml);
    };
  };
}
