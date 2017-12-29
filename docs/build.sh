#!/bin/bash

if [ $# -lt 1 ]; then
	LANGS="ru en"
elif [[ $# -eq 1 ]]; then
	LANGS=$1
fi

for lang in $LANGS; do
	echo -e "\n\nLANG=$lang. Creating single page source"
	./concatenate.py $lang
	echo -e "\n\nLANG=$lang. Building multipage..."
  	mkdocs build -f mkdocs_$lang.yml
  	echo -e "\n\nLANG=$lang. Building single page..."
	mkdocs build -f mkdocs_$lang'_single_page.yml'
done
