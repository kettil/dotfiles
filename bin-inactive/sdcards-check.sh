#!/bin/bash

echo "#"
echo "# Start SD card check"
echo "#####################"
echo "#"
echo "# time: $(date)"
echo "# start write test"
echo "#"

/usr/local/bin/f3write "${1}"

echo "#"
echo "# end write test"
echo "# time: $(date)"
echo "# start read test"
echo "#"

/usr/local/bin/f3read "${1}"

echo "#"
echo "# end write test"
echo "# time: $(date)"
echo "#"
