#!/bin/bash
set -euo pipefail

command="archinstall --config araic/usrcfg.json --creds araic/usrcred.json"

if [ ! -d araic ]; then
    while true; do
        read -p "Araic is not downloaded. Would you like to download it now? [y/n] " yn
        case $yn in
            [Y/y]* ) echo "Downloading now..."; ./initaraic.sh; break;;
            [N/n]* ) echo "Cancelling..."; exit;;
            * ) echo "Please specify y or n.";;
        esac
    done
fi

trap "$command" EXIT

echo "Running archinstall command in 2 seconds..."
sleep 2
