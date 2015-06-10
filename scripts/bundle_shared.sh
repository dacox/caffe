#! /bin/bash

tar czvf shared.tar.gz `ldd distribute/lib/libcaffe.so  | cut -d'>' -f2 | sed 's/ \(.*\) (.*/\1/g' | sed 's/\.so.*/\.so*/g' | tr "\n" " "`
sudo find / -name "*cblas*" | grep -v virtualenv > MANIFEST.txt
sudo find / -name "*atlas*" | grep -v virtualenv | grep -v dpkg >> MANIFEST.txt
sudo find / -name "*lmdb*" | grep -v virtualenv >> MANIFEST.txt
tar czvf more_shared.tar.gz `cat MANIFEST.txt | tr "\n" " "`

