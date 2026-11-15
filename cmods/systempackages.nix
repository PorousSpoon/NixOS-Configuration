{pkgs, inputs, ...}:
let
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in {
  environment = {
      # Packages installed on system

      systemPackages = with pkgs; [
        kitty
        home-manager
        vim
        git
        librewolf
        openssh
        emacs
        sops
        age
        keepassxc
        flatpak
        kdePackages.kdeconnect-kde
        gocryptfs
        ripgrep
        syncthing
      ];

      # Excluded packages (bloatware that comes with KDE)
      plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
        kmail
        khelpcenter
        plasma-browser-integration
        elisa
        krdc
        ktorrent
        marble
        parley
        kate
        ark
        qrca
        kwallet
        kwalletmanager
        ksshaskpass
        okular
        discover
      ];
    };
    services.xserver.excludePackages = with pkgs; [
      xterm
    ];
    programs.vim = {
      enable = true;
      defaultEditor = true;
    };
    programs.kdeconnect.enable = true;
    nixpkgs.config.allowUnfree = true;
  }
