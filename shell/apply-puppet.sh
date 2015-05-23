#!/bin/bash

JET_DIRECTORY="/usr/local/jet"
JET_FILES_DIRECTORY="/usr/local/jet"

OS=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" CODENAME)

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR='/etc/puppet'

function validate_url(){
  if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then echo "true"; fi
}

URL_REGEX='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

if [ -z "$JET_MANIFEST" ]; then
    echo "You do not provide manifest file";
    exit 1
fi

if [[ $JET_MANIFEST =~ $URL_REGEX ]]; then

    if [[ ! `wget -S --spider $JET_MANIFEST  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
        echo "File ${JET_MANIFEST} do not exists" 
        exit 1
    fi

    echo "Downloading puppet file to ${PUPPET_DIR}/manifests/default.pp" 
    wget --quiet -O ${PUPPET_DIR}/manifests/default.pp $JET_MANIFEST
else
    if [ ! -f $JET_MANIFEST ]; then
        echo "File ${JET_MANIFEST} do not exists"
        exit 1
    fi

    echo "Move puppet file to ${PUPPET_DIR}/manifests/default.pp" 
    mv $JET_MANIFEST ${PUPPET_DIR}/manifests/default.pp
fi

echo 'Applying puppet'
/usr/bin/puppet apply ${PUPPET_DIR}/manifests/default.pp
