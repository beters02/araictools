#!/bin/bash
set -euo pipefail

source ./getvar.sh

echo "Setting global username and email..."
git config --global user.email "$EMAIL"
git config --global user.name "$USERNAME"

echo "Cloning araic repo..."
git clone "$URL"

echo "Setting remote url with token..."
cd araic
git remote set-url origin "$URL"
cd ..

echo "Done!"
echo "Run ./addf {file_name} if you'd like to add a file"
