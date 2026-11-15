{ pkgs, lib, config, ... }: {
  options.modDevelopment.enable = lib.mkEnableOption "Enables the cmodules/development.nix module.";
  config = lib.mkIf config.modDevelopment.enable {
    environment.systemPackages = with pkgs; [
      devenv
      direnv
      # Python
      (python3.withPackages (ps: with ps; [
        pyqt5
        requests
      ]))
      libsForQt5.qt5.qtwayland
      libsForQt5.qt5.qtx11extras
      pyright

      # Rust
      rustc
      cargo
      gcc 
      rust-analyzer
    ];
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
