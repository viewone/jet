#!/bin/bash
# 
# Script for checking and setting basic environmental variables
# 
# @package   jet
# @author    Piotr Kierzniewski <p.kierzniewski@viewone.pl>
# @copyright 2014 ViewOne Sp. z o.o.
# @license   http://opensource.org/licenses/MIT MIT
# @link      https://github.com/viewone/jet

echo "Set basic \$PATH"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echo "Check if locale is properly setup";

if [ -z "$LANGUAGE" ] || [ -z "$LANG" ] || [ -z "$LC_ALL" ] || [ -z "$LC_CTYPE" ]; then

    echo "Locale is setup incorect script will use en_US.UTF-8 locale";

    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LC_CTYPE=en_US.UTF-8
else 
    echo "Lcale is set properly and do not need to updates";
fi