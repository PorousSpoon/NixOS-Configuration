{ pkgs, lib, config, ... }: {
  options.modVim.enable = lib.mkEnableOption "Enables vim.nix module.";
  config = lib.mkIf config.modVim.enable {
    programs.vim = {
      enable = true;
      extraConfig = ''
        set mouse=a
        colorscheme habamax
        set tabstop=4
        set shiftwidth=4
        set number
        set relativenumber
        syntax on
        set expandtab
        set autoindent
      '';
    };
  };
}
