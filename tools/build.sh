#!/bin/bash
# Build IPoUGRS RFC draft from XML source
# Requires: xml2rfc (pip install xml2rfc)

set -e

if ! command -v xml2rfc &>/dev/null; then
    echo "xml2rfc not found. Install: pip install xml2rfc"
    exit 1
fi

XML="spec/draft-papadopoulos-ipougrs-00.xml"

if [ ! -f "$XML" ]; then
    echo "XML source not found: $XML"
    echo "Copy from previous build output or regenerate."
    exit 0
fi

mkdir -p build
xml2rfc "$XML" --html --out build/draft-papadopoulos-ipougrs-00.html
xml2rfc "$XML" --text --out build/draft-papadopoulos-ipougrs-00.txt

echo "Built:"
ls -la build/draft-papadopoulos-ipougrs-00.*
