{lib, config, pkgs, ...}: {
  options.modFish.enable = lib.mkEnableOption "Configuration for fish shell";
  config = lib.mkIf config.modFish.enable {
    programs.fish = {
      enable = true;
      package = pkgs.fish;     
      interactiveShellInit = ''
        set fish_greeting
      '';
    };
  };
}
