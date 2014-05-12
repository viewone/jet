class { 'server':
    hostname => 'dev',
    locale_default => 'pl_PL.UTF-8',
    locale_available => ["pl_PL.UTF-8 UTF-8", "en_US.UTF-8 UTF-8", "de_DE.UTF-8 UTF-8"],
    timezone => "Europe/Warsaw",
    ntp_servers => [ '0.pl.pool.ntp.org', '1.pl.pool.ntp.org', '2.pl.pool.ntp.org', '3.pl.pool.ntp.org' ],
    packages => ['git-core', 'zsh']
}
