{ 
	pkgs ? import <nixpkgs> {},
	kernel ? pkgs.linux_6_6
}:

pkgs.stdenv.mkDerivation {
  name = "hevd";
  version = "3.0";
  
  src = ./.;

  nativeBuildInputs = kernel.moduleBuildDependencies ++ [
  	pkgs.gcc
  	pkgs.gnumake
  ];

	makeFlags = kernel.makeFlags ++ [
    "KERNELDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "INSTALL_MOD_PATH=$(out)"
  ];

  buildFlags = [ "modules" ];
  installTargets = [ "modules_install" ];
}
