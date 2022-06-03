#!/bin/sh
export CWD=`pwd`
for envvar in `cat secrets.env`; do
    export $envvar
done

for USER in `ls services/`; do
    echo install-all-services $USER
    su $USER -c ./install-user-services.sh
done