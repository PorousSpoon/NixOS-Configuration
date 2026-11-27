{ lib, config, ... }: {
  imports = [
    ./vim.nix
    ./git.nix
    ./kitty.nix
    ./emacs.nix
    ./bash.nix
    ./fish.nix
    ./eza.nix
    ./starship.nix
  ];
  modVim.enable = true;
  modGit.enable = true;
  modKitty.enable = true;
  modEmacs.enable = true;
  modEza.enable = true;
  modStarship.enable = true;

  # Shells
  modFish.enable = true;
  modBash.enable = false;
}
