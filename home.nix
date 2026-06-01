{ config, pkgs, ... }:

{
home.username = "north";
home.homeDirectory = "/home/north";
programs.git = {
	enable = true;
	settings.user.name = "north";
	settings.user.email = "north@nixos-hp-spectre";
};
home.stateVersion = "26.05";
programs.bash = {
	enable = true;
	initExtra = ''
		PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
	'';
};
programs.vim = {
	enable = true;
	extraConfig = ''
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
xsession = {
	enable = true;
	windowManager.i3 = {
		enable = true;
		config = {
			modifier = "Mod4";
			bars = [{
				command = "${pkgs.i3status}/bin/i3status";
			}];
			keybindings = {
				"Mod4+Return" = "exec kitty";
				"Mod4+d" = "exec dmenu_run";
				"Mod4+Shift+q" = "kill";
				"Mod4+1" = "workspace 1";
				"Mod4+2" = "workspace 2";
			};
		};
	};
};
home.packages = with pkgs; [
	rofi
	pavucontrol
	networkmanagerapplet
	grim
	slurp
	wl-clipboard
];
}
