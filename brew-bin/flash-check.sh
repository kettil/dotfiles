#!/bin/bash

echo "#########################"
echo "#  Start SD card check  #"
echo "#########################"
echo ""
timeWriteStart=$(date +%s)

/usr/local/bin/f3write "${1}"

timeWriteEnd=$(date +%s)
echo '#'
echo "# Elapsed time for \"write\": $((timeWriteEnd - $timeWriteStart))s"
echo '#'
echo ""
timeReadStart=$(date +%s)

/usr/local/bin/f3read "${1}"

timeReadEnd=$(date +%s)
echo '#'
echo "# Elapsed time for \"write\": $((timeWriteEnd - $timeWriteStart))s"
echo "# Elapsed time for \"read\":  $((timeReadEnd - $timeReadStart))s"
echo "# Elapsed time:             $((timeReadEnd - $timeWriteStart))s"
echo '#'
echo ""
