{pkgs, ...}: {
  users.users.zulu = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "libvirtd" "docker"];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
