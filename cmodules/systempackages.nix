{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      kitty
      home-manager
      vim
      git
      librewolf
      openssh
      emacs
    ];
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
      okular
      discover
    ];
  };
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];
}
