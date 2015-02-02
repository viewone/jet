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
RELEASE=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" RELEASE)
CODENAME=$(/bin/bash "${JET_DIRECTORY}/shell/os-detect.sh" CODENAME)

if [[ ! -f "${VIEWONE_DIRECTORY}/update-puppet" ]]; then
    if [ "${OS}" == 'debian' ] || [ "${OS}" == 'ubuntu' ]; then
        echo "Downloading http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"
        wget --quiet --tries=5 --timeout=10 -O "${VIEWONE_DIRECTORY}/puppetlabs-release-${CODENAME}.deb" "http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"
        echo "Finished downloading http://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb"

        dpkg -i "${VIEWONE_DIRECTORY}/puppetlabs-release-${CODENAME}.deb" >/dev/null

        echo "Running update-puppet apt-get update"
        apt-get update >/dev/null
        echo "Finished running update-puppet apt-get update"

        echo "Updating Puppet to latest version"
        apt-get -y install puppet >/dev/null
        PUPPET_VERSION=$(puppet help | grep 'Puppet v')
        echo "Finished updating puppet to latest version: ${PUPPET_VERSION}"

        touch "${VIEWONE_DIRECTORY}/update-puppet"
        echo "Created empty file /home/viewone/jet/update-puppet"
    fi
fi
