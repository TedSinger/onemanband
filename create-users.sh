#!/bin/sh
groupadd onemanband
for u in `ls services/`; do
    useradd $u -g onemanband -m
    for f in `ls -A userstuff/`; do
        cp userstuff/$f /home/$u/
        chsh $u -s /bin/bash
        chown $u /home/$u/$f
        chgrp onemanband /home/$u/$f
    done
done