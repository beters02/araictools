#!/bin/bash
set -euo pipefail

push() {
    git push -u origin main
}

doexit() {
    cd ..
    exit
}

cd araic

while true; do
    read -p "Do you want to push? [y/n] " pyn
    case $pyn in
        [Yy]* ) echo "Pushing to main..."; push; doexit;;
        [Nn]* ) echo "Exiting..."; doexit;;
        * ) echo "Please answer yes or no.";;
    esac
done
