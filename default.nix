{
  pkgs,
  texliveCombined,
}: {
  default = pkgs.stdenv.mkDerivation rec {
    name = "lys-document";

    src = ./.;

    nativeBuildInputs = (with pkgs; [lyx findutils]) ++ [texliveCombined];

    unpackPhase = ''
      mkdir -p ./workdir
      cp -r $src/* ./workdir
      cd ./workdir
    '';

    buildPhase = ''
      export HOME=$(mktemp -d)
      mkdir -p ./userdir $out
      for file in $( find . -type f -name '*.lyx' ); do
        echo $file
        lyx -userdir ./userdir -E luatex "./''${file}.tex" "./$file"
        lualatex -interaction=nonstopmode -output-directory=$out -output-format=pdf "./''${file}.tex"
      done
    '';

    dontInstall = true;
  };
}
