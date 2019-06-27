#!/bin/bash

/pandoc.sh --to=latex --variable=mainfont:"arial" "$@"
