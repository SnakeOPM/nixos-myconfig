{ config, pkgs, ...}: {
	nixpkgs.config.allowUnfree = true; 
	home = {
		username = "jalemi";
		homeDirectory = "/home/jalemi";
		stateVersion = "24.05";
		packages = with pkgs; [
			htop
			neofetch
			spotify
			steam
			telegram-desktop
			discord
			git
			vscode
			php
			go
		];
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/";
			sysconfig = "sudo nano /etc/nixos/configuration.nix";
			sayhi = "echo hii";
		};
	};
}
