#!/bin/bash

domain="$1"
file1="$2" 

if [ -z "$domain" ] || [ -z "$2" ] ; then  
  echo -e "Error: Domain or file arguments are missing.\n"
  echo "Usage: subfind <domain> <file-to-save-to>"
  echo "Example: subfinder.sh example.com domains.txt"
  exit 1
fi

assetfinder --subs-only "$domain" | sort | uniq | httprobe -prefer-https | tee -a works.txt

echo -e "\n...saving the results...\n"

file="works.txt"

if [ ! -f "$file" ]; then
  echo "...encountered an error while processing the results..."
  exit 1
fi

echo "---------------------------" > "$file1"
grep -E '^https://' "$file" >> "$file1"    
echo "---------------------------" >> "$file1"
grep -E '^http://' "$file" >> "$file1"

echo "...successfully saved to $file1..."

rm works.txt
