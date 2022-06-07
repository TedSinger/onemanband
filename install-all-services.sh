#!/bin/sh
status=0
for check in $(ls checks/); do
    ./checks/$check
    status=$(($status + $?))
done

if [ $status -eq 0 ]; then
    echo All checks passed. Installing services...
    export CWD=`pwd`
    for envvar in `cat secrets.env`; do
        export $envvar
    done

    for USER in `ls services/`; do
        echo install-all-services $USER
        su $USER -c ./install-user-services.sh
    done
else
    echo "A check failed! Aborting install"
fi
