{lib, config, ...}: {

  # The disk will be mounted at /mnt/server/
  fileSystems."/mnt/server" = {
    device = "/dev/disk/by-uuid/1236a72c-d090-4641-aa79-0a826c066868";
    fsType = "btrfs"; 
  };
}
