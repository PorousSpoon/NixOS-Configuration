{lib, config, ...}: {
  options.modVirtualisation.enable = lib.mkEnableOption "Enables virtualisation through virt-manager"; 
  config = lib.mkIf config.modVirtualisation.enable {
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.swtpm.enable = true;
      };
      docker = {
        enable = true;
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  };
}
