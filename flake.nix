{
  description = "My custom build of vim";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
          enableParallelInstalling = false;
          NIX_ENFORCE_NO_NATIVE = false;

          nativeBuildInputs = with pkgs; [
          ];

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

          CC = pkgs.stdenv.cc;
          PREFIX = "$(out)";

          # which.sh is used to for vim's own shebang patching, so make it find
          # binaries for the host platform.
          preConfigure = ''
            export HOST_PATH
            substituteInPlace src/which.sh --replace '$PATH' '$HOST_PATH'
          '';

          configurePhase = ''
            cp ${code}/feature.h ./src
            ${code}/conf.sh $out $PWD
            # sed -Ei 's#\./configure#sh ./configure#' configure
            # sed -Ei 's#auto/configure#sh auto/configure#' src/configure
            # sh ${code}/conf.sh $out $PWD
          '';

          buildPhase = ''
            make -j $NIX_BUILD_CORES
          '';

          preInstall = ''
            mkdir -p $out/bin
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
