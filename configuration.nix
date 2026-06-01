{ config, lib, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos-hp-spectre";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.north = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

  environment.systemPackages = with pkgs; [
	home-manager
	vim
	kitty
	git
	librewolf
    openssh
  ];

system.stateVersion = "26.05"; 
security.sudo.enable = true;
nix.settings.experimental-features = [ "nix-command" "flakes" ];
nixpkgs.config.allowUnfree = true;
environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
services.udev.extraRules = ''
	SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{LIBINPUT_IGNORE_DEVICE}="1"
'';
services.xserver.enable = true;
services.xserver.windowManager.i3 = {
	enable = true;
	package = pkgs.i3;
	extraPackages = with pkgs; [
		dmenu
		i3status
	];
};
services.displayManager.ly.enable = true;
}
