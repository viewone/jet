#!/bin/bash

CORE_DIRECTORY="/home/viewone/jet"

OS=$(/bin/bash "${CORE_DIRECTORY}/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${CORE_DIRECTORY}/shell/os-detect.sh" CODENAME)

if [[ ! -d "${CORE_DIRECTORY}" ]]; then
    mkdir "${CORE_DIRECTORY}"

    echo "${CORE_DIRECTORY}" > "/${CORE_DIRECTORY}/core-directory.txt"

    cat "${CORE_DIRECTORY}/shell/self-promotion.txt"
    echo "Created directory ${CORE_DIRECTORY}"
fi

if [[ ! -f "${CORE_DIRECTORY}/initial-setup-repo-update" ]]; then
    if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
        echo "Running initial-setup apt-get update"
        apt-get update >/dev/null
        touch "${CORE_DIRECTORY}/initial-setup-repo-update"
        echo "Finished running initial-setup apt-get update"
    fi
fi
