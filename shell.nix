{
  pkgs,
  texliveCombined,
}: {
  default = pkgs.mkShell {
    buildInputs =
      [
        texliveCombined
      ]
      ++ (with pkgs; [
        lyx
        (hunspell.withDicts (ds: with ds; [en_US he_IL]))
      ]);

    shellHook = ''
      unset SOURCE_DATE_EPOCH
    '';
  };
}
