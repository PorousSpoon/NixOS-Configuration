{ lib, config, ... }: {
  imports = [
    ./vim.nix
    ./kitty.nix
    ./bash.nix
    ./git.nix
  ];
  modVim.enable = true;
  modKitty.enable = true;
  modBash.enable = true;
  modGit.enable = true;
}
