{ pkgs, ... }:
{
	xsession = {
		enable = true;
		windowManager.i3 = {
			enable = true;
			config = {
				modifier = "Mod4";
                bars = [
                  { command = "${pkgs.i3status-rust}/bin/i3status-rust"; }
                ];
				keybindings = {
					"Mod4+Return" = "exec kitty";
					"Mod4+d" = "exec dmenu_run";
					"Mod4+Shift+q" = "kill";
					"Mod4+1" = "workspace 1";
					"Mod4+2" = "workspace 2";
				};
				fonts = {
					names = [ "JetBrains Mono" ];
					size = "12.0";
				};
                startup  = [
                  { command = "feh --bg-fill /home/north/Pictures/terminator.jpg"; always = true; notification = false; }
                ];
			};
		};
	};
}
