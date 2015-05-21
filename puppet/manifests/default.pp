class { 'server':
    hostname => 'mci',
    default_locale => 'en_US.UTF-8',
    locales => ["en_US.UTF-8 UTF-8"],
    timezone => "America/New_York",
    ntp_servers => [ '0.pl.pool.ntp.org', '1.pl.pool.ntp.org', '2.pl.pool.ntp.org', '3.pl.pool.ntp.org' ],
    packages => ['git-core', 'zsh']
}