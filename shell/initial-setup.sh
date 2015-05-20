#!/bin/bash

JET_DIRECTORY="/usr/local/jet"
JET_FILES_DIRECTORY="/usr/local/jet"

OS=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" CODENAME)

if [[ ! -d "${JET_FILES_DIRECTORY}" ]]; then
    mkdir "${JET_FILES_DIRECTORY}"
    echo "Created directory ${JET_FILES_DIRECTORY}"
fi

echo "${JET_DIRECTORY}" > "${JET_FILES_DIRECTORY}/core-directory.txt"

if [[ ! -f "${JET_FILES_DIRECTORY}/initial-setup-repo-update" ]]; then
    if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
        echo "Running initial-setup apt-get update"
        apt-get update >/dev/null
        touch "${JET_FILES_DIRECTORY}/initial-setup-repo-update"
        echo "Finished running initial-setup apt-get update"
    fi
fi
