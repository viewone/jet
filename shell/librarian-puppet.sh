#!/bin/bash

JET_DIRECTORY="/usr/local/jet"
JET_FILES_DIRECTORY="/usr/local/jet"

OS=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" ID)
CODENAME=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" CODENAME)

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/

$(which git > /dev/null 2>&1)
FOUND_GIT=$?

if [ "${FOUND_GIT}" -ne '0' ] && [ ! -f "${JET_FILES_DIRECTORY}/librarian-puppet-installed" ]; then

    echo 'Installing git'

    apt-get -q -y install git-core > /dev/null

    echo 'Finished installing git'
fi

if [[ ! -d "${PUPPET_DIR}" ]]; then
    mkdir -p "${PUPPET_DIR}"
    echo "Created directory ${PUPPET_DIR}"
fi

cp "${JET_DIRECTORY}/puppet/Puppetfile" "${PUPPET_DIR}"
echo "Copied Puppetfile"

if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
    if [[ ! -f "${JET_FILES_DIRECTORY}/librarian-base-packages" ]]; then
        echo 'Installing base packages for librarian'
        apt-get install -y build-essential ruby-dev >/dev/null
        echo 'Finished installing base packages for librarian'

        touch "${JET_FILES_DIRECTORY}/librarian-base-packages"
    fi
fi

if [[ ! -f "${JET_FILES_DIRECTORY}/librarian-puppet-installed" ]]; then
    echo 'Installing librarian-puppet'
    gem install librarian-puppet >/dev/null
    echo 'Finished installing librarian-puppet'

    echo 'Running initial librarian-puppet'
    cd "${PUPPET_DIR}" && librarian-puppet install --clean >/dev/null
    echo 'Finished running initial librarian-puppet'

    touch "${JET_FILES_DIRECTORY}/librarian-puppet-installed"
else
    echo 'Running update librarian-puppet'
    cd "${PUPPET_DIR}" && librarian-puppet update >/dev/null
    echo 'Finished running update librarian-puppet'
fi