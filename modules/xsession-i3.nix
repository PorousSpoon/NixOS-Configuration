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
					"Mod4+3" = "workspace 3";
					"Mod4+4" = "workspace 4";
					"Mod4+5" = "workspace 5";
					"Mod4+6" = "workspace 6";
					"Mod4+7" = "workspace 7";
					"Mod4+8" = "workspace 8";
					"Mod4+9" = "workspace 9";
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
