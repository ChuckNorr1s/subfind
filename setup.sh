#!/bin/bash

check_installed() {
  command -v "$1" >/dev/null 2>&1
}

install_go() {
  echo "Installing Go..."
  sudo apt update && sudo apt install golang
  echo "Go installed!"
}

install_assetfinder() {
  echo "Installing assetfinder..."
  go install github.com/tomnomnom/assetfinder@latest
  echo "assetfinder installed!"
}

install_httprobe() {
  echo "Installing httprobe..."
  go install github.com/tomnomnom/httprobe@latest
  echo "httprobe installed!"
}

if ! check_installed "go"; then
  install_go
fi

if ! check_installed "assetfinder"; then
  install_assetfinder
fi

if ! check_installed "httprobe"; then
  install_httprobe
fi

echo "Setup Successful!"
