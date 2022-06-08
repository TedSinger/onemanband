#!/bin/sh
failure=0
for check in checks/*; do
    output=$("$check")
    if [ "$output" != '' ]; then
        echo "$output" > "$check".log
        echo "$(basename "$check")" failed - see "$check".log for details
        failure=1
    fi
done

if [ $failure -eq 0 ]; then
    echo All checks passed. Installing services...
    CWD=$(pwd)
    export CWD

    set -o allexport
    . "$CWD"/secrets.env
    set +o allexport

    for USER in services/*; do
        USER="$(basename "$USER")"
        su "$USER" -c ./install-user-services.sh
    done
else
    echo "A check failed! Aborting install"
fi
