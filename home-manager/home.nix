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
			telegram-desktop
			discord
			git
			vscode
			php83
			go
			autorandr
			php83Packages.composer
			phpunit
			temurin-bin-21
			wine
		];
	};

	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/flake.nix";
			homerebuild = "home-manager switch --flake ~/nix/flake.nix";
			sysconf = "nano ~/nix/nixos/configuration.nix";
			homeconf = "nano ~/nix/home-manager/home.nix";
			sayhi = "echo hii";
		};
	};
}
