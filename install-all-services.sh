#!/bin/sh
for USER in `ls services/`; do
    echo install-all-services $USER
    export CWD=`pwd`
    su $USER -c ./install-user-services.sh
done