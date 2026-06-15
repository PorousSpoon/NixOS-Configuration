{ lib, config, ... }: {
  imports = [
    ./vim.nix
    ./bash.nix
    ./git.nix
    ./kitty.nix
  ];
  modVim.enable = true;
  modBash.enable = true;
  modGit.enable = true;
  modKitty.enable = true;
}
