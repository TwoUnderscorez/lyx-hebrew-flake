{
  pkgs,
  texliveCombined,
  hunspellDictionaries,
}: {
  default = pkgs.mkShell {
    buildInputs =
      [
        texliveCombined
      ]
      ++ (with pkgs; [
        lyx
        (hunspell.withDicts hunspellDictionaries)
      ]);

    shellHook = ''
      unset SOURCE_DATE_EPOCH
    '';
  };
}
