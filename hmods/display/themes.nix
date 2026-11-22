{pkgs, lib, config, ...}:
let
  themes = "${pkgs.kitty-themes}/share/kitty-themes/themes";
  lightTheme = "${themes}/AtomOneLight.conf";
  darkTheme  = "${themes}/Carbonfox.conf";
in
{
  fonts.fontconfig.enable = true;
  home.file.".local/bin/toggle-theme" = {
    executable = true;
    force = true;
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail
      STATE="$HOME/.local/state/ui-theme"
      KITTY_RT="$HOME/.config/kitty/runtime-theme.conf"
      mkdir -p "$(dirname "$STATE")" "$HOME/.config/kitty" "$HOME/.vim"

      LIGHT="${lightTheme}"
      DARK="${darkTheme}"

      cur=$(cat "$STATE" 2>/dev/null || echo dark)
      if [[ "$cur" == dark ]]; then
        lookandfeeltool -a Otto-Light
        plasma-apply-wallpaperimage "/home/zulu/pictures/wallpapers/abstract-white.jpg" 2>/dev/null || true
        printf 'include %s\n' "$LIGHT" > "$KITTY_RT"
        emacsclient -e "(load-theme 'doom-one-light t)" 2>/dev/null || true
        echo 'colorscheme default' > "$HOME/.vim/runtime-theme.vim"
        echo light > "$STATE"
      else
        lookandfeeltool -a Nothing
        plasma-apply-wallpaperimage "/home/zulu/pictures/wallpapers/abstract-black.jpg" 2>/dev/null || true
        printf 'include %s\n' "$DARK" > "$KITTY_RT"
        emacsclient -e "(load-theme 'doom-one t)" 2>/dev/null || true
        echo 'colorscheme habamax' > "$HOME/.vim/runtime-theme.vim"
        echo dark > "$STATE"
      fi
      plasma-apply-cursortheme Skyrim-by-ru5tyshark-cursors
      kitty @ load-config 2>/dev/null || killall -SIGUSR1 kitty 2>/dev/null || true
    '';
  };

  home.file.".local/bin/ask-theme" = {
    executable = true;
    force = true;
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail
      STATE="$HOME/.local/state/ui-theme"
      KITTY_RT="$HOME/.config/kitty/runtime-theme.conf"
      mkdir -p "$(dirname "$STATE")" "$HOME/.config/kitty" "$HOME/.vim"

      LIGHT="${lightTheme}"
      DARK="${darkTheme}"

      if kdialog --yesno "Use light theme (Otto-Light)?"$'\n'"No = dark (Nothing)"; then
        lookandfeeltool -a Otto-Light
        plasma-apply-wallpaperimage "/home/zulu/pictures/wallpapers/abstract-white.jpg" 2>/dev/null || true
        printf 'include %s\n' "$LIGHT" > "$KITTY_RT"
        emacsclient -e "(load-theme 'doom-one-light t)" 2>/dev/null || true
        echo 'colorscheme peachpuff' > "$HOME/.vim/runtime-theme.vim"
        echo light > "$STATE"
      else
        lookandfeeltool -a Nothing
        plasma-apply-wallpaperimage "/home/zulu/pictures/wallpapers/abstract-black.jpg" 2>/dev/null || true
        printf 'include %s\n' "$DARK" > "$KITTY_RT"
        emacsclient -e "(load-theme 'doom-one t)" 2>/dev/null || true
        echo 'colorscheme retrobox' > "$HOME/.vim/runtime-theme.vim"
        echo dark > "$STATE"
      fi
      plasma-apply-cursortheme Skyrim-by-ru5tyshark-cursors
      kitty @ load-config 2>/dev/null || killall -SIGUSR1 kitty 2>/dev/null || true
    '';
  };

  home.file.".config/autostart/ask-theme.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Ask UI Theme
    Exec=/home/zulu/.local/bin/ask-theme
    X-KDE-AutostartScript=true
  '';
}
