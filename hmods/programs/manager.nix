{ lib, config, ... }: {
  imports = [
    ./vim.nix
    ./bash.nix
    ./git.nix
    ./kitty.nix
    ./emacs.nix
  ];
  modVim.enable = true;
  modBash.enable = true;
  modGit.enable = true;
  modKitty.enable = true;
  modEmacs.enable = true;
}
