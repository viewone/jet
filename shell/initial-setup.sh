#!/bin/bash

VAGRANT_CORE_FOLDER="/vagrant"

OS=$(/bin/bash "${VAGRANT_CORE_FOLDER}/viewone/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${VAGRANT_CORE_FOLDER}/viewone/shell/os-detect.sh" CODENAME)

if [[ ! -d /.viewone-stuff ]]; then
    mkdir /.viewone-stuff

    echo "${VAGRANT_CORE_FOLDER}" > "/.viewone-stuff/vagrant-core-folder.txt"

    cat "${VAGRANT_CORE_FOLDER}/viewone/shell/self-promotion.txt"
    echo "Created directory /.viewone-stuff"
fi

if [[ ! -f /.viewone-stuff/initial-setup-repo-update ]]; then
    if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
        echo "Running initial-setup apt-get update"
        apt-get update >/dev/null
        touch /.viewone-stuff/initial-setup-repo-update
        echo "Finished running initial-setup apt-get update"
    elif [[ "${OS}" == 'centos' ]]; then
        echo "Running initial-setup yum update"
        yum update -y >/dev/null
        echo "Finished running initial-setup yum update"

        echo "Installing basic development tools (CentOS)"
        yum -y groupinstall "Development Tools" >/dev/null
        echo "Finished installing basic development tools (CentOS)"
        touch /.viewone-stuff/initial-setup-repo-update
    fi
fi

if [[ "${OS}" == 'ubuntu' && ("${CODENAME}" == 'lucid' || "${CODENAME}" == 'precise') && ! -f /.viewone-stuff/ubuntu-required-libraries ]]; then
    echo 'Installing basic curl packages (Ubuntu only)'
    apt-get install -y libcurl3 libcurl4-gnutls-dev >/dev/null
    echo 'Finished installing basic curl packages (Ubuntu only)'

    touch /.viewone-stuff/ubuntu-required-libraries
fi
