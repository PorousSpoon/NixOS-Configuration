{lib, config, ...}: {
  options.modSyncthing.enable = lib.mkEnableOption "Enables the syncthing.nix module";
  config = lib.mkIf config.modSyncthing.enable {
    services.syncthing = {
      enable = true;
      guiAddress = "127.0.0.1:8384";
      user = "zulu";
      group = "users";
      guiPasswordFile = config.sops.secrets."syncthing_gui_password".path;
      systemService = true;
      openDefaultPorts = true;
      settings = {
        gui.user = "pcrate";
        devices = {
          "OPCE4" = {
            id = "P3BPFP6-GEFHDCR-CXMWZGN-CKMJMEZ-TAG6F63-PN3J7LP-TP24F7T-ZLN34AZ"; 
            name = "OP Nord CE4 CPH2619"; 
          }; 
        }; 

        folders = {
          "/home/zulu/keepass" = {
            enable = true;
            label = "KeePass";
            path = "/home/zulu/keepass";
            devices = [ "OPCE4" ];
          };
          "/home/zulu/books" = {
            enable = true;
            label = "Books";
            id = "0ebcw-liypz";
            path = "/home/zulu/books";
            devices = [ "OPCE4" ];
          };
          "/home/zulu/obsidian" = {
            enable = true;
            label = "Obsidian";
            id = "hvjmu-sxk3w";
            path = "/home/zulu/obsidian";
            devices = [ "OPCE4" ];
          };
          "/home/zulu/music" = {
            enable = true;
            label = "Music";
            id = "ztnxn-q66dp";
            path = "/home/zulu/music";
            devices = [ "OPCE4" ];
          };
        };

        urAccepted = false; 
      };
    };

    # sops
    sops.secrets."syncthing_gui_password" = {};
  };
}
