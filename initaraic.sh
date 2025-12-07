#!/bin/bash
set -euo pipefail

source ./getvar.sh

echo "Setting global username and email..."
git config --global user.email "$EMAIL"
git config --global user.name "$USERNAME"

echo "Cloning araic repo..."
git clone "$URL"

echo "Shortening file names..."
cd araic

if [ -f user_credentials.json ]; then
    mv user_credentials.json usrcred.json
    echo "user_credentials.json is now usrcred.json"
fi

if [ -f user_configuration.json ]; then
    mv user_configuration.json usrcfg.json
    echo "user_configuration.json is now usrcfg.json"
fi

echo "Setting remote url with token..."
git remote set-url origin "$URL"

cd ..

echo "Done!"
echo "Run ./addf {file_name} if you'd like to add a file"
