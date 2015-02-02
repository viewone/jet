#!/bin/bash

if [ ! -z $1 ] 
then 
    JET_DIRECTORY=$1
else
    JET_DIRECTORY="/home/viewone/jet"
fi

if [ ! -z $2 ] 
then 
    VIEWONE_DIRECTORY=$2
else
    VIEWONE_DIRECTORY="/home/viewone"
fi

OS=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" CODENAME)

if [[ ! -d "${VIEWONE_DIRECTORY}" ]]; then
    mkdir "${VIEWONE_DIRECTORY}"
    echo "Created directory ${VIEWONE_DIRECTORY}"
fi

echo "${JET_DIRECTORY}" > "${VIEWONE_DIRECTORY}/core-directory.txt"

cat "${JET_DIRECTORY}/shell/self-promotion.txt"

if [[ ! -f "${VIEWONE_DIRECTORY}/initial-setup-repo-update" ]]; then
    if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
        echo "Running initial-setup apt-get update"
        apt-get update >/dev/null
        touch "${VIEWONE_DIRECTORY}/initial-setup-repo-update"
        echo "Finished running initial-setup apt-get update"
    fi
fi
