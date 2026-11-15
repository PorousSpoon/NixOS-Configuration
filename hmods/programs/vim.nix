{ pkgs, lib, config, ... }: {
  options.modVim.enable = lib.mkEnableOption "Enables vim.nix module.";
  config = lib.mkIf config.modVim.enable {
    programs.vim = {
      enable = true;
      extraConfig = ''
        set mouse=a
        colorscheme retrobox
        set tabstop=4
        set shiftwidth=4
        set number
        set relativenumber
        syntax on
        set expandtab
        set autoindent
        if filereadable(expand('~/.vim/runtime-theme.vim'))
          source ~/.vim/runtime-theme.vim
        endif 
      '';
      defaultEditor = true;
    };
  };
}
