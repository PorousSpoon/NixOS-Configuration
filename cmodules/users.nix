{ ... }: {
  users.users.north = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video" "libvirtd"];
  };
}
