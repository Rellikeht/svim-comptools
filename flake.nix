{
  description = "My custom build of vim";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    flakeUtils.url = github:numtide/flake-utils;
    vim = {
      url = github:vim/vim;
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flakeUtils,
    vim,
  }: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  in
    flakeUtils.lib.eachSystem systems (system: let
        pkgs = nixpkgs.legacyPackages.${system};
        name = "svim";
        src = vim;
        code = self;
      in {
        packages = {
          default =
            pkgs.stdenv.mkDerivation rec {
              inherit name system src;
              enableParallelBuilding = true;

              buildInputs = with pkgs; [
                ncurses
                binutils

                xorg.libXt
                xorg.libX11
                xorg.libICE

                # ??
                xorg.libXpm
                motif
                gpm
                zlib
                libgcrypt
              ];

              nativeBuildInputs = with pkgs;
                [
                ]
                ++ buildInputs;

              PREFIX = "$(out)";
              CC = pkgs.gcc;

              configurePhase = "
            mkdir -p $out/bin $out/share/man
            cp ${code}/feature.h src/
            ${code}/conf.sh
          ";

              buildPhase = "
            make -j $NIX_BUILD_CORES
          ";

              installPhase = "
#            make install
          ";

              meta = with nixpkgs.lib; {
                homepage = "https://vim.org";
              };
            };
        };
      });
}
