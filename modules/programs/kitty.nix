{ pkgs, lib, config, ... }: {
  options.modKitty.enable = lib.mkEnableOption "Enables kitty.nix module";
  config = lib.mkIf config.modKitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrains Mono";
        size = 12;
      };
      settings = {
        enable_audio_bell = true;
      };
      themeFile = "Carbonfox";
    };
  };
}
