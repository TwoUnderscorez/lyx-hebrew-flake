{
  description = "LyX";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";

    hunspellDictionaries = ds: with ds; [en_US he_IL];

    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        # The LyX package doesn't provide an option to pass in a list of dictionaries
        # This will patch the LyX package with the dictionaries defined above.
        (final: prev: let
          hunspellWithDictionaries = prev.hunspell.withDicts hunspellDictionaries;
        in {
          lyx = prev.lyx.overrideAttrs (oldAttrs: {
            # Add the hunspell with our dictionaries to the list of runtime dependencies
            buildInputs = oldAttrs.buildInputs ++ [hunspellWithDictionaries];
            # Create a link to Hunspell's dictionary directory where LyX expectes to find it.
            postInstall = ''
              ln -sf ${hunspellWithDictionaries}/share/hunspell $out/share/lyx/dicts
            '';
          });
        })
      ];
    };

    texliveCombined = pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-medium # TexLive medium scheme
        collection-langother # Contains all the dependencies to make LuaLaTeX work with Hebrew
        ;
    };
  in {
    devShells.${system} = import ./shell.nix {
      inherit pkgs texliveCombined hunspellDictionaries;
    };
    packages.${system} = import ./default.nix {
      inherit pkgs texliveCombined;
    };
  };
}
