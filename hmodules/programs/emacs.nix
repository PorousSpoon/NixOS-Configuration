{ pkgs, lib, config, ...}: {
  options.modEmacs.enable = lib.mkEnableOption "Enables emacs.nix module";
  config = lib.mkIf config.modEmacs.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs30;
      extraPackages = epkgs: [
        epkgs.which-key
        epkgs.doom-themes
        epkgs.vterm
      ];
      extraConfig = ''
        (setq inhibit-startup-screen t)
        (setq initial-scratch-message nil)
        (electric-indent-mode 1)
        (setq-default indent-tabs-mode nil)
        (setq-default tab-width 4)
        (global-display-line-numbers-mode 1)
        (set-face-attribute 'default nil
                            :family "JetBrains Mono"
                            :height 120)
        (load-theme 'doom-dark+ t)
        (tab-bar-mode 1)
        (setq scroll-conservatively 101)
        (setq mouse-wheel-progressive-speed nil)
        (global-set-key (kbd "C-h f") 'describe-function)
        (global-set-key (kbd "C-h v") 'describe-variable)
        (global-set-key (kbd "C-<return>") 'vterm)
        (show-paren-mode 1)
        (global-auto-revert-mode 1)
        (use-package which-key
          :config
          (which-key-mode 1))
        (use-package vterm)
      '';
    };
    services.emacs = {
      enable = true;
      client.enable = true;
      startWithUserSession = true;
      package = pkgs.emacs30;
    };
  };
}
