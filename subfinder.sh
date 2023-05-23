#!/bin/bash

domain="$1"

if [ -z "$domain" ]; then
  echo "Error: Domain argument is missing."
  echo "Usage: ./subfinder.sh <domain>"
  echo "Example: ./subfinder.sh example.com"
  exit 1
fi

assetfinder --subs-only "$domain" | sort | uniq | tee -a output.txt && cat output.txt | httprobe cat output.txt | tee -a works.txt

echo "...Organizing in a pretty format..."

file="works.txt"

if [ ! -f "$file" ]; then
  echo "Error: $file does not exist."
  exit 1
fi

grep -E '^https://' "$file" >> pretty.txt
echo "---------------------------" >> pretty.txt
grep -E '^http://' "$file" >> pretty.txt

echo "...Organized to pretty.txt..."
