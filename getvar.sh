#!/bin/bash

USERNAME="beters02"
EMAIL="brycepeters04@gmail.com"

echo "Getting access token..."
TOKEN=$(curl http://e.closetraccoon.com:5051/get/archinstall1)

if [ -z $TOKEN ]; then
    echo "Could not get user token."
    cd ..
    exit
fi

BASEURL="https://$USERNAME:$TOKEN@github.com/$USERNAME"
URL="$BASEURL/araic"
