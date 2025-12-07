#!/bin/bash
set -euo pipefail

doexit() {
    cd ..
    exit
}

if [ -z $1 ]; then
    echo "Must supply a filename to add."
    doexit
fi

cd araic

if [ ! -f $1 ]; then
    echo "File araic/$1 does not exist."
    doexit
fi

echo "Adding file..."
git add $1
echo "File added!"
cd ..
./commit.sh
