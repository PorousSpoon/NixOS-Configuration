{ pkgs, ... }: {
  home.packages = with pkgs; {
    rofi-wayland
    waybar
    hyprlock
    swaync
    wl-clip-persist
    cliphist
    grim
    slurp
    grimblast
    hyprpicker
    udiskie
    pavucontrol
    networkmanagerapplet
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    configType = "hyprlang";
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };
};
