{pkgs, lib, config, ...}: {
  options.modEmacs.enable = lib.mkEnableOption "Enables emacs.nix module";
  config = lib.mkIf config.modEmacs.enable {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs30;
      extraPackages = epkgs: [
        epkgs.which-key
        epkgs.doom-themes
        epkgs.vterm
        epkgs.magit
        epkgs.corfu
        epkgs.yasnippet
        epkgs.breadcrumb
        epkgs.rainbow-delimiters
        epkgs.dashboard
        epkgs.pulsar
        epkgs.nix-mode
        epkgs.indent-bars
        epkgs.outline-indent
        epkgs.rust-mode
      ];
      extraConfig = ''
        (menu-bar-mode -1)
        (tool-bar-mode -1)
        (scroll-bar-mode -1)
        (global-hl-line-mode 1)
        (setq inhibit-startup-screen t)
        (require 'dashboard)
        (dashboard-setup-startup-hook)
        (setq initial-buffer-choice 'dashboard-open)
        (add-hook 'server-after-make-frame-hook 'dashboard-open)
        (electric-indent-mode 1)
        (setq-default indent-tabs-mode nil)
        (setq-default tab-width 4)
        (setq display-line-numbers-type 'relative)
        (global-display-line-numbers-mode 1)
        (set-face-attribute 'default nil
                            :family "JetBrains Mono"
                            :height 120)
        (use-package doom-themes
          :config
          (load-theme 'doom-one t)
          (set-face-foreground 'font-lock-comment-face "#6c8a7e"))
        (tab-bar-mode 1)
        (setq scroll-conservatively 101)
        (setq mouse-wheel-progressive-speed nil)
        (global-set-key (kbd "C-h f") 'describe-function)
        (global-set-key (kbd "C-h v") 'describe-variable)
        (global-set-key (kbd "C-S-<return>") 'vterm)
        (show-paren-mode 1)
        (global-auto-revert-mode 1)
        (use-package which-key
          :config
          (which-key-mode 1))
        (use-package vterm)
        (setq tramp-default-method "sudo")
        (use-package magit
          :ensure t
          :bind ("C-x g" . magit-status))
        (use-package yasnippet
          :ensure t
          :config
          (yas-global-mode 1))
        (use-package corfu
          :ensure t
          :custom
          (corfu-auto t)
          (corfu-auto-delay 0.2)
          :init
          (global-corfu-mode))
        (use-package breadcrumb
          :ensure t
          :config
          (breadcrumb-mode 1))
        (add-hook 'prog-mode-hook 'eglot-ensure)
        (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
        (use-package pulsar
          :ensure t
          :bind
          ( :map global-map
            ("C-x l" . pulsar-pulse-line)
            ("C-x L" . pulsar-highlight-permanently-dwim))
          :init
          (pulsar-global-mode 1)
          :config
          (setq pulsar-delay 0.055)
          (setq pulsar-iterations 5)
          (setq pulsar-face 'pulsar-red)
          (setq pulsar-region-face 'pulsar-red)
          (setq pulsar-highlight-face 'pulsar-blue))
        (use-package outline-indent
          :commands outline-indent-minor-mode
          :custom
          (outline-indent-ellipsis " ▼")
          :bind (:map outline-indent-minor-mode-map
                ("C-c o o" . outline-indent-open-fold)
                ("C-c o c" . outline-indent-close-fold)
                ("C-c o m" . outline-indent-close-folds)
                ("C-c o r" . outline-indent-open-folds)
                ("C-c o O" . outline-indent-open-fold-rec)
                ("C-c o TAB" . outline-indent-toggle-fold)
                ("C-c o t" . outline-indent-toggle-level-at-point)
                ("C-c o v" . outline-indent-select)
                ("C-c o s" . outline-indent-narrow)
                ("C-c o ;" . outline-indent-comment)
                ("C-c o f" . outline-indent-forward-same-level)
                ("C-c o b" . outline-indent-backward-same-level)
                ("C-c o <right>" . outline-indent-shift-right)
                ("C-c o <left>" . outline-indent-shift-left)
                ("C-c o i" . outline-indent-insert-heading))
          :hook (prog-mode . outline-indent-minor-mode))
        (use-package indent-bars
          :hook ((prog-mode) . indent-bars-mode))
        (require 'nix-mode)
        (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
        (require 'rust-mode)
        (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
        (setq backup-directory-alist '(("." . "~/.emacs/backups/")))
        (setq trusted-content
              '("~/projects/"
                "~/.dotfiles/"))
      '';
    };
    services.emacs = {
      enable = true;
      client.enable = true;
      package = pkgs.emacs30;
      socketActivation.enable = true;
    };
  };
}
