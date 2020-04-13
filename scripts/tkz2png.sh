#!/usr/bin/env bash

for TIKZFILE in "$@"; do
  [ -z "${TIKZFILE##*.tkz}" ] || continue
  TEXFILE=${TIKZFILE/.tkz/.tex}
  PDFFILE=${TIKZFILE/.tkz/.pdf}
  PNGFILE=${TIKZFILE/.tkz/.png}
  WEBPFILE=${TIKZFILE/.tkz/.webp}

  CONTENT=$(cat "$TIKZFILE")

  cat > "$TEXFILE" << EOF
\documentclass{standalone}
\usepackage{mathptmx}
%\usepackage[dvipsnames,svgnames]{xcolor}
\usepackage{tkz-euclide}
\usepackage[active,pdftex,tightpage]{preview}
\PreviewEnvironment[]{tikzpicture}
\DeclareSymbolFont{symbolsb}{OMS}{cmsy}{m}{n}
\SetSymbolFont{symbolsb}{bold}{OMS}{cmsy}{b}{n}
\DeclareSymbolFontAlphabet{\mathcal}{symbolsb}
\begin{document}
${CONTENT}
\end{document}
EOF

  latexmk -pdf "$TEXFILE"
  #convert -density 300 "$PDFFILE" -strip -trim -quality 90 "$PNGFILE"
  #convert -density 300 "$PDFFILE" -strip -flatten -quality 90 "$PNGFILE"
  pdftoppm -png "$PDFFILE" > "$PNGFILE"
  #cwebp "$PNGFILE" -o "$WEBPFILE"
  latexmk -C
  rm "$TEXFILE"
done
