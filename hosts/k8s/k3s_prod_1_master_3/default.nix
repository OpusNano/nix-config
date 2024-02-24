{
  pkgs,
  vars_networking,
  mylib,
  ...
}: let
  hostName = "k3s-prod-1-master-3"; # define your hostname.
  k8sLib = import ../lib.nix;
  coreModule = k8sLib.gencoreModule {
    inherit pkgs hostName vars_networking;
  };
in {
  imports =
    (mylib.scanPaths ./.)
    ++ [
      coreModule
    ];
}
