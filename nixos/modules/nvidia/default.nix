{
inputs,
system, 
lib, 
config,
pkgs, 
...
}:
let
  addUnstablePackages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config = config.nixpkgs.config;
    };
  };
in
{
  nixpkgs.overlays = [ addUnstablePackages ];
  boot.kernelPackages = pkgs.unstable.linuxPackages;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    open = false;
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false;
    };
    nvidiaSettings = true;
  };
}
