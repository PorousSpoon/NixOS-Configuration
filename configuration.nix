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
	terminator
	git
	librewolf
    openssh
  ];

system.stateVersion = "26.05"; 
security.sudo.enable = true;
nix.settings.experimental-features = [ "nix-command" "flakes" ];
nixpkgs.config.allowUnfree = true;
services.udev.extraRules = ''
	SUBSYSTEM=="input", ATTRS{name}=="AT Translated Set 2 keyboard", ENV{LIBINPUT_IGNORE_DEVICE}="1"
'';
services.xserver.enable = true;
services.desktopManager.plasma6.enable = true;
services.displayManager.sddm.enable = true;
environment.plasma6.excludePackages = with pkgs.kdePackages; [
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
 ];
 services.xserver.excludePackages = with pkgs; [
    xterm
  ];
}
