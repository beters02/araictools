#!/bin/bash
set -euo pipefail

doexit() {
    cd ..
    exit
}

commit() {
    read -p "Please specify a commit message. " msg
    if [ -z "$msg" ]; then
        msg="Commit from araic archinstall"
    fi
    git commit -m "$msg"
}

cd araic

while true; do
    read -p "Do you want to commit? [y/n] " yn
    case $yn in
        [Yy]* ) commit; cd ..; ./push.sh; break;;
        [Nn]* ) echo "Exiting..."; doexit;;
        * ) echo "Please answer yes or no.";;
    esac
done

