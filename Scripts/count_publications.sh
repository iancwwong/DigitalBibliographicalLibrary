#!/usr/bin/sh

# This program counts the number of each publication type in a given xml file

# Check program usage
if [ "$#" -ne 1 ]; then
	echo "Usage: bash count_publications.sh <source xml>" >&2
	exit 1
fi

# List of publication types
arr=( "article" "inproceedings" "proceedings" "book" "incollection" "phdthesis" "mastersthesis" "www" )

# Get filename
filename=$1

# Iterate through all publication types
numPubs=0
for i in "${arr[@]}"
do
	str=`grep "</$i>" $filename | wc -l`
	echo "$i: $str"
	numPubs=$((numPubs+str))
done
echo "== Total publications: $numPubs"
