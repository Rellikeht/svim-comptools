{
  description = "My custom build of vim";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flakeUtils.url = "github:numtide/flake-utils";
    vim = {
      url = "github:vim/vim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flakeUtils,
    vim,
  }: let
    systems = flakeUtils.lib.allSystems;
    # systems = [
    #   "x86_64-linux"
    #   # Untested, should be fine
    #   "aarch64-linux"
    #   "i686-linux"
    #   "armv7l-linux"
    # ];
  in
    flakeUtils.lib.eachSystem systems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      name = "svim";
      src = vim;
      code = self;
    in {
      packages = {
        default = pkgs.stdenv.mkDerivation {
          inherit name system src;
          enableParallelBuilding = true;

          buildInputs = with pkgs;
            [
              ncurses
              gpm

              gettext
              zlib
              libgcrypt
            ]
            ++ (with pkgs.xorg; [
              libXt
              libX11
              libICE

              libSM
              libXext
              libXpm
              libXaw
              libXau
              libXmu
            ]);

          phases = [
            "unpackPhase"
            "configurePhase"
            "buildPhase"
            "installPhase"
          ];

          hardeningDisable = ["fortify"];

          CC = "${pkgs.gcc}/bin/gcc";
          PREFIX = "$(out)";
          # MOTIF_LIB = "${pkgs.motif}/lib/";

          # which.sh is used to for vim's own shebang patching, so make it find
          # binaries for the host platform.
          preConfigure = ''
            export HOST_PATH
            substituteInPlace src/which.sh --replace '$PATH' '$HOST_PATH'
          '';

          configurePhase = ''
            mkdir -p $out
            cp ${code}/feature.h ./src
            ${code}/conf.sh "$PREFIX"
          '';

          buildPhase = ''
            make -j $NIX_BUILD_CORES
          '';

          installPhase = ''
            make install
          '';

          # TODO C
          meta = with nixpkgs.lib; {
            homepage = "https://vim.org";
          };
        };
      };
    });
}
