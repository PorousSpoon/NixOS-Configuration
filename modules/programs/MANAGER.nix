{ lib, config, ... }: {
  imports = [
    ./vim.nix
    ./bash.nix
    ./git.nix
  ];
  modVim.enable = true;
  modBash.enable = true;
  modGit.enable = true;
}
