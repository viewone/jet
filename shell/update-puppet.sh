#!/bin/bash

CORE_DIRECTORY=$(cat "/home/viewone/jet/vagrant-core-folder.txt")

OS=$(/bin/bash "${CORE_DIRECTORY}/shell/os-detect.sh" ID)
RELEASE=$(/bin/bash "${CORE_DIRECTORY}/shell/os-detect.sh" RELEASE)
CODENAME=$(/bin/bash "${CORE_DIRECTORY}/shell/os-detect.sh" CODENAME)

if [[ ! -f "${CORE_DIRECTORY}/update-puppet" ]]; then
    if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
        echo "Downloading http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"
        wget --quiet --tries=5 --timeout=10 -O "${CORE_DIRECTORY}/update-puppet/puppetlabs-release-${CODENAME}.deb" "http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"
        echo "Finished downloading http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"

        dpkg -i "${CORE_DIRECTORY}/update-puppet/puppetlabs-release-${CODENAME}.deb" >/dev/null

        echo "Running update-puppet apt-get update"
        apt-get update >/dev/null
        echo "Finished running update-puppet apt-get update"

        echo "Updating Puppet to latest version"
        apt-get -y install puppet >/dev/null
        PUPPET_VERSION=$(puppet help | grep 'Puppet v')
        echo "Finished updating puppet to latest version: ${PUPPET_VERSION}"

        touch "${CORE_DIRECTORY}/update-puppet"
        echo "Created empty file /home/viewone/jet/update-puppet"
    fi
fi
