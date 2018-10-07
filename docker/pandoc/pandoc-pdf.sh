#!/bin/bash

# generate a hash
PANDOC_HASH="$(uuid | awk '{print toupper($0)}' | cut -d'-' -f 1,2,3)"

/pandoc.sh --to=latex --metadata=hash:"${PANDOC_HASH}" "$@"
