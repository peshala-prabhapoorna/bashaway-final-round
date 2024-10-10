#!/usr/bin/env bash

mkdir -p out
touch out/decoded.txt

while read -r line; do
    line2=$(echo "$line" | base64 --decode)
    echo "$line2" >> out/decoded.txt
done < src/codes.txt

last=$(tail -1 src/codes.txt)
line2=$(echo "$last" | base64 --decode)
echo "$line2" >> out/decoded.txt
