{lib, config, ...}: {
  options.modDvorak.enable = lib.mkEnableOption "Enables cmodules/dvorak.nix";
  config = lib.mkIf config.modDvorak.enable {
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us,us";
        variant = ",dvorak";
        options = "grp:win_space_toggle";
      };
    };
  };
}
