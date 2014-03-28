class { 'server':
    hostname => 'dev',
    locale_default => 'pl_PL.UTF-8',
    locale_available => ["pl_PL.UTF-8 UTF-8", "en_US.UTF-8 UTF-8", "de_DE.UTF-8 UTF-8"],
    timezone => "Europe/Warsaw",
    ntp_servers => [ '0.pl.pool.ntp.org', '1.pl.pool.ntp.org', '2.pl.pool.ntp.org', '3.pl.pool.ntp.org' ],
    packages => ['zsh', 'git'],
    users => {
        'root' => {
            password => '$6$rP/Ox5Yg$R/5L7FjC5ZG1FmeCI.MYtJR0/2liV8/2I2MheZiXSDaHMb2B7Me9NrM/1TyZwiH0EKYuSYhqW1Ug5/EBuculN.',
        },
        'kierzniak' => {
            key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDLubCG1/U59cAOnA9ImmlT7NTs9c3qo9W3qu1uFrrmTZnV5DdjbQWY+sjQvNzgPtKyPXfYYZOOAIoPWmBbFDE6gLkT3cKMMwji9tJbqdwoXoDBEL+eFYM0O+e8IEJmqyjj3EaQ2ChexGThSIZ+h4Cun9W4jRK6Kw6Pcc0uhgqp/U6iPm9ZW9szmBbH16KqwwFVJa/oLTRTinF7qUYel+M0KhD7hR0u5VDrCDnbIURyIWIQKCY4OhXwJIJzkPT/N5Jbj/9mtfT5kuBTixFMNcg9e17djZ1qmXL1URvqWCVk8zinHziKwa1D7jzrng8KNZjAKWXr5OITXZLP4kF7PmlX',
            key_name => 'kierzniak@ironman.local',
            password => '$6$tMzEwn7z$88Ev9M3NCXRzB5U12Cr9PTfBspKOHq4E/JZSH4kOf.r8Bw0.sWqvf65yiCaNXUVBINREpucOh65ILMTJzsyt50',
            groups => ['sudo'],
            shell => '/bin/bash',
        }
    },
}