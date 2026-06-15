{ pkgs, lib, config, ... }: {
  options.modKitty.enable = lib.mkEnableOption "Enables kitty.nix module";
  config = lib.mkIf config.modKitty.enable {
    programs.kitty = {
      enable = true;
      themeFile = "Carbonfox";
      font = {
        name = "JetBrains Mono";
      };
      keybindings = {
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "alt+5" = "goto_tab 5";
        "alt+6" = "goto_tab 6";
        "alt+7" = "goto_tab 7";
        "alt+8" = "goto_tab 8";
        "alt+9" = "goto_tab 9";
      };
    };
  };
}
