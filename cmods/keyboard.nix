{lib, config, ...}: {
  imports = [
    ./services/dvorak.nix
    ./services/keybindings.nix
  ];
  modDvorak.enable = true;
  modKeybindings.enable = true;
}
