{lib, config, pkgs, ...}: {
  options.modEza.enable = lib.mkEnableOption "Configuration for pkgs.eza";
  config = lib.mkIf config.modEza.enable {
    programs.eza = {
      enable = true;
      git = true;
      package = pkgs.eza;
      icons = "auto";
      theme = "onedark";
      colors = "auto";
      enableFishIntegration = true;
    };
  };
}
