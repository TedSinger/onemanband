#!/bin/sh
groupadd prior
for u in `ls services/`; do
    useradd $u -g prior -m
    for f in `ls -A userstuff/`; do
        cp userstuff/$f /home/$u/
        chsh $u -s /bin/bash
        chown $u /home/$u/$f
        chgrp prior /home/$u/$f
    done
done