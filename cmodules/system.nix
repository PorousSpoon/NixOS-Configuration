{ ... }: {
  system.stateVersion = "26.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  services.libinput.enable = true;
  security.sudo.enable = true;
  time.timeZone = "Asia/Kolkata";
  services.udev.extraRules = ''
    SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{LIBINPUT_IGNORE_DEVICE}="1"
  '';
  programs.dconf.enable = true;
}
