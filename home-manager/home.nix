{ config, pkgs, unstable, ... }: {
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./config/hyprland/default.nix
  ];
  home = {
    username = "jalemi";
    homeDirectory = "/home/jalemi";
    stateVersion = "24.05";
    packages = builtins.attrValues {
      inherit (pkgs)
        bottles
        libreoffice
        krita
        dragon
        unrar
        openvpn
        nekoray
        htop
        neofetch
        spotify
        spicetify-cli
        telegram-desktop
        vesktop
        git
        vscodium
        php83
        go
        autorandr
        phpunit
        temurin-bin-17
        firefox-wayland
        appimage-run
        wine
        nixpkgs-fmt;
      inherit (pkgs.php83Extensions)
        xdebug;
      inherit (pkgs.php83Packages)
        composer;
      inherit (pkgs.unstable)
        zapret;
    };
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix/flake.nix";
      homerebuild = "home-manager switch --flake ~/nix/flake.nix";
      sysconf = "nano ~/nix/nixos/configuration.nix";
      homeconf = "nano ~/nix/home-manager/home.nix";
      sayhi = "echo hii";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "thefuck" ];
      theme = "agnoster";
    };
  };
}
