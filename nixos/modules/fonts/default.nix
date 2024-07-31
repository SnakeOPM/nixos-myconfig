{pkgs, ...}:
{
  fonts.packages = builtins.attrValues {
  inherit (pkgs)
  feather;
  nerdfonts = pkgs.nerdfonts.override {
    fonts = ["SpaceMono"];
    };
  };
}