mkdir -p out
gzip -c src/* > out/"$(basename src/* | cut -d. -f1)".gz
