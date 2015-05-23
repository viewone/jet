class { 'server':
    default_locale => 'en_US.UTF-8',
    locales => ["en_US.UTF-8 UTF-8"],
    timezone => "Europe/Warsaw",
    ntp_servers => [ '0.pl.pool.ntp.org', '1.pl.pool.ntp.org', '2.pl.pool.ntp.org', '3.pl.pool.ntp.org' ],
    hostname => 'mci.viewone.pl',
    hosts => {
      'localhost' => {
        ip => '127.0.0.1',
        host_aliases => 'localdomain.localhost localhost',
      },
      'localhost_debian' => {
        ip => '127.0.0.1',
        host_aliases => 'debian-wheezy-amd64.vagrantup.com debian-wheezy-amd64',
      },
      'localhost_mci' => {
        ip => '127.0.0.1',
        host_aliases => 'mci.vieowne.pl mci',
      },
      'localhost_ipv6' => {
        ip => '::1',
        host_aliases => 'localhost ip6-localhost ip6-loopback',
      },
      'localhost_ipv6-localnet' => {
        ip => 'ff00::0',
        host_aliases => 'ip6-localnet',
      },
      'localhost_ipv6-mcastprefix' => {
        ip => 'ff00::0',
        host_aliases => 'ip6-mcastprefix',
      },
      'localhost_ipv6-allnodes' => {
        ip => 'ff00::1',
        host_aliases => 'ip6-allnodes',
      },
      'localhost_ipv6-allrouters' => {
        ip => 'ff00::2',
        host_aliases => 'ip6-allrouters',
      },
      'remote' => {
        ip => '10.0.2.15',
        host_aliases => 'debian-wheezy-amd64.vagrantup.com debian-wheezy-amd64',
      },
      'remote_mci' => {
        ip => '10.0.2.15',
        host_aliases => 'mci.vieowne.pl mci',
      },
    },
    sources => {
      'debian' => {
        'location' => 'http://ftp.pl.debian.org/debian/',
        'release' => 'wheezy'
      },
      'updates' => {
        'location' => 'http://ftp.pl.debian.org/debian/',
        'release' => 'wheezy-updates'
      },
      'security' => {
        'location' => 'http://security.debian.org/',
        'release' => 'wheezy/updates'
      },
    },
    ssh => {
      'Port' => '22',
      'Protocol' => '2',
      'UsePrivilegeSeparation' => 'yes',
      'PasswordAuthentication' => 'no',
      'KeyRegenerationInterval' => '3600',
      'ServerKeyBits' => '768',
      'X11Forwarding' => 'no',
      'SyslogFacility' => 'AUTH',
      'LogLevel' => 'INFO',
      'AcceptEnv' => 'LANG LC_*',
      'LoginGraceTime' => '120',
      'PermitRootLogin' => 'no',
      'StrictModes' => 'yes',
      'RSAAuthentication' => 'yes',
      'PubkeyAuthentication' => 'yes',
      'IgnoreRhosts' => 'yes',
      'RhostsRSAAuthentication' => 'no',
      'HostbasedAuthentication' => 'no',
      'PermitEmptyPasswords' => 'no',
      'ChallengeResponseAuthentication' => 'no',
      'X11Forwarding' => 'no',
      'X11DisplayOffset' => '10',
      'PrintMotd' => 'no',
      'PrintLastLog' => 'yes',
      'TCPKeepAlive' => 'yes',
      'Subsystem' => 'sftp /usr/lib/openssh/sftp-server',
      'UsePAM' => 'yes',
      'UseDNS' => 'no'
    },
    users => {
         'kierzniak' => {
              uid => 500,
              gid => 500,
              key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDS9jdn3+3yRiGuwLn/lM3N7mq+bLWplrWoRDuHIRV4ah+PllaufOKNmUGiNHtL3EMtpj1gOaw/F3edv/A56h52xDDqiUxqXE/M9GLzKrp+FzuvWOdLqf8YHkZ33UFTgsFf9QUZBGw/0loCge5fd2YhmVSg1wPQtS06Sf9v1XulLbnMAiDX07UoAsCMTu29Qh7M4LMsQWUDIuu8OHY7sZn89EQm19B30yuxoi5hEtOz8rtBSJ+Phrf3dk9Qhe46fXOn4dgNK+PfbvJ5VkSxFLBI15QVhzqFVCTcISHXkF32pbjrFXNP7sHdNd7tjvPYH/dZZbtM3i5AtJfoNsUMmpCn',
              key_name => 'kierzniak',
              password => '$1$6ARpdYY0$JBsBOlNAjMoMjMuE17b2t.',
         },
    },
    packages => ['git-core', 'zsh'],
}