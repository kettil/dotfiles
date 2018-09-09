#!/bin/bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dAutoRotatePages=/None -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=merged-$(date +%Y-%m-%d-%H-%M-%S).pdf "$@"
