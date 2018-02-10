#!/bin/bash
#

for filez in *
do
    echo " Converting -> $filez"
	mv $filez $filez.tmp ; tr -d '\r' < $filez.tmp > $filez
done
rm *.tmp
echo " Done!"
