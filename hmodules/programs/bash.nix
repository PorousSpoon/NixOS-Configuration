{ pkgs, lib, config, ... }: {
  options.modBash.enable = lib.mkEnableOption "Enables bash.nix module.";
  config = lib.mkIf config.modBash.enable {
    programs.bash = {
      enable = true;
      initExtra = ''
        PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
      '';
    };
  };
}
