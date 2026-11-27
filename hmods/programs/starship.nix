{lib, config, pkgs, ...}: {
  options.modStarship.enable = lib.mkEnableOption "Configuration for Startship";
  config = lib.mkIf config.modStarship.enable {
    programs.starship = {
      enable = true;
      package = pkgs.starship;
      enableFishIntegration = true;
      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
