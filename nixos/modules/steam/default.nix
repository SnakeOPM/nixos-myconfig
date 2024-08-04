{pkgs, nixpkgs, inputs, ...}:

{
 nixpkgs.overlays = [
    (self: super: {
      steam = super.steam.override {
        extraPkgs =
          super:
          builtins.attrValues {
            inherit (super)
              yad
              curl
              imagemagick
              libpng
              libpulseaudio
              libvorbis
              libkrb5
              keyutils
              libgdiplus
              glxinfo
              mesa-demos
              vulkan-tools
              vulkan-headers
              vulkan-caps-viewer
              vulkan-validation-layers
              vulkan-extension-layer
              vulkan-loader
              vkBasalt
              mangohud
              steamtinkerlaunch
              source-han-sans
              wqy_zenhei
              ;
            inherit (super.xorg)
              xhost
              libXcursor
              libXi
              libXinerama
              libXScrnSaver
              ;
            inherit (super.gnome) zenity;
            inherit (super.stdenv.cc.cc) lib;
            inherit (inputs.nix-gaming.packages.${super.system}) wine-discord-ipc-bridge;
          };
      };
    })
  ];
programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
}
