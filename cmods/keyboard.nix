{lib, config, ...}: {
  imports = [
    ./user-conf/dvorak.nix
    ./user-conf/keybindings.nix
  ];
  modDvorak.enable = true;
  modKeybindings.enable = true;
}
