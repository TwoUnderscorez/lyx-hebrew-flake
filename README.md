# LyX Flake with Hebrew support

## Setup

Make sure you have Nix installed, then type `nix develop` while in this directory. The first time
this happens it's going to take a few minutes. After that, it should be instant.

Consider using `nix-direnv`, this handy tool will automatically do `nix develop` for you as
well as provide better shell caching.

### LyX Setup

This is not a Home Manager module, so unfortunately you'll have to do some of the setup manually.

#### Hebrew Setup

See [MadLyX](https://mkali56.wixsite.com/madlyx) pages 14-16. Any other setup from the MadLyX is optional.

#### LaTeX Compiler Setup

This setup relies on LuaLaTeX and Babel.

To compile/preview a document, make sure you've selected LuaTeX in LyX. 

To do so globally, go to Tools -> File handling -> With {non-}Tex Fonts: PDF LuaTeX.

Per document, Document -> Settings -> Output -> Default output format: PDF LuaTeX

## Compiling without launching LyX

To compile to PDF all `*.lyx` files in this repo to a PDF, run `nix build` and see the
results under the `result` folder.

## LaTeX Fonts

The fonts are configured in Document -> Settings -> LaTeX Preamble using the
`babelfont` command. See Babel documention to use other fonts. Note that the culmus
fonts should already be installed in the dev shell.

To view installed fonts run `albatross -tdb0 a | tail -n+6`, to view installed 
culmus fonts run `albatross -tdb0 a | tail -n+6| grep -C 3 culmus`.


Pull requests are welcome!
