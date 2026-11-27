{pkgs, lib, config, ...}: {
  options.modKitty.enable = lib.mkEnableOption "Enables kitty.nix module";
  config = lib.mkIf config.modKitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      extraConfig = ''
            include runtime-theme.conf
            cursor_trail 1
            cursor_trail_color red
            tab_bar_style powerline
            active_tab_foreground #eee
            active_tab_background #321bfc
            active_tab_font_style bold-italic
      '';
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
      settings = {
        shell = "fish";
        allow_remote_control = "yes";
      };
    };
  };
}
