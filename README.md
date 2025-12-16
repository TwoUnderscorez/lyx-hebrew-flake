# LyX Flake with Hebrew support

## Setup

This setup relies on LuaLaTeX and Babel because they are superior to XeLaTex/PdfLaTex and Polyglossia.

To compile/preview a document, make sure you've selected LuaTeX in LyX. 

To do so globally, go to Tools -> File handling -> With {non-}Tex Fonts: PDF LuaTeX.

Per document, Document -> Settings -> Output -> Default output format: PDF LuaTeX

## Fonts

The fonts are configured in Document -> Settings -> LaTeX Preamble using the
`babelfont` command. See Babel documention to use other fonts.