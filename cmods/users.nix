{ ... }: {
  users.users.zulu = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "libvirtd" "docker"];
  };
}
