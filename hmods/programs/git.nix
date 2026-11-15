{ pkgs, lib, config, ... }: {
  options.modGit.enable = lib.mkEnableOption "Enables git.nix module";
  config = lib.mkIf config.modGit.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "zulu";
          email = "zulu@nixos-gigabyte";
        };
      };
    };
  };
}
