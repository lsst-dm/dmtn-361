#!/bin/bash
# Flatten DMTN-361 into the single-file layout the ADASS proceedings want:
#   I701.tex (inputs inlined), I701.bib (local.bib + allcitations.bib), I701_fN.eps
# Usage: ./toadass.sh [target_dir]
set -euo pipefail

SRC=DMTN-361
P=I701
DEST=${1:-/Users/womullan/LSSTgit/docs/ADASS2026-Proceedings/papers/$P}
export TEXMFHOME=${TEXMFHOME:-lsst-texmf/texmf}

cd "$(dirname "$0")"

# make sure meta/authors and the .aux are current
make authors.tex
#make $SRC.pdf

# figures: figures/<name>.eps -> ${P}_fN.eps, in order of appearance
SEDARGS=()
n=0
for fig in $(grep -o '\\plotone\(\[[^]]*\]\)\?{figures/[^}]*}' body.tex | sed 's/.*{figures\/\(.*\)}/\1/'); do
    n=$((n + 1))
    cp "figures/$fig.eps" "$DEST/${P}_f$n.eps"
    SEDARGS+=(-e "s#{figures/$fig}#{${P}_f$n}#")
done

# inline \input{x} (one level is enough here), then fix bib and figure names
perl -pe 'if (/^\\input\{(\w+)\}\s*$/) { open(my $f, "<", "$1.tex") or die "$1.tex: $!"; local $/; $_ = <$f> . "\n" }' $SRC.tex |
    sed -e "s/^\\\\bibliography{.*}/\\\\bibliography{$P}/" \
        "${SEDARGS[@]}" > "$DEST/$P.tex"

# all citations are already in local.bib and allcitations.bib
cat local.bib allcitations.bib > "$DEST/$P.bib"

echo "Wrote $DEST/$P.tex, $DEST/$P.bib and $n figure(s)"
