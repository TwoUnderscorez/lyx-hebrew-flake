{
  description = "LyX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = {...} @ inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};

    texliveCombined = pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-medium # TexLive medium shceme
        collection-langother # Contains all the dependencies to make LuaLaTeX work with Hebrew
        # Used in latex preamble
        relsize
        titlesec
        luabidi
        # To make LyX work with Heberw documents
        # upquote
        # bidi
        # zref
        # luabidi
        ;
    };
  in {
    devShells.${system} = import ./shell.nix {
      inherit pkgs texliveCombined;
    };
    packages.${system} = import ./default.nix {
      inherit pkgs texliveCombined;
    };
  };
}
