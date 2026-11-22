{ ... }: {
  system.stateVersion = "26.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  services.libinput.enable = true;
  time.timeZone = "Asia/Kolkata";
  programs.dconf.enable = true;
  security = {
    sudo.enable = true;
  };

  services.openssh = {
    passwordAuthentication = false;
    permitRootLogin = "no";
  };

  services.blueman.enable = true; # For bluetooth

  hardware = {
    enableAllFirmware = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  documentation = {
    enable = false;
    nixos.enable = false;
  };
}
