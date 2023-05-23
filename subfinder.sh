#!/bin/bash

domain="$1"

if [ -z "$domain" ]; then
  echo "Error: Domain argument is missing."
  echo "Usage: ./subfinder.sh <domain>"
  echo "Example: ./subfinder.sh example.com"
  exit 1
fi

assetfinder --subs-only "$domain" | sort | uniq | tee -a output.txt && cat output.txt | httprobe cat output.txt | tee -a works.txt
