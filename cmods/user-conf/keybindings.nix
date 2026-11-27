{lib, config, ...}: {
  options.modKeybindings.enable = lib.mkEnableOption "Enables cmodules/user-services/keybindings.nix module";
  config = lib.mkIf config.modKeybindings.enable {
    services.keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" "-0001:0001" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              "leftshift+leftmeta+f23" = "capslock";
            };
          };
        };
      };
    };  
  };
}
