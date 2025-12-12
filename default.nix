{
  pkgs,
  texliveCombined,
}: {
  default = pkgs.stdenv.mkDerivation rec {
    name = "lys";

    src = ./.;

    nativeBuildInputs = (with pkgs; [lyx]) ++ [texliveCombined];

    unpackPhase = ''
      mkdir -p ./workdir
      cp -r $src/* ./workdir
      cd ./workdir
    '';

    # lyx -userdir ./userdir -E pdflatex ./acid.tex ./acid.lyx
    # mkdir -p ./userdir ./outdir
    # pdflatex -output-directory=./outdir ./acid.tex
    buildPhase = ''
      export HOME=$(mktemp -d)
      mkdir $out
      lualatex -interaction=nonstopmode -output-directory=$out -output-format=pdf test.tex
    '';

    dontInstall = true;
  };
}
