#!/bin/bash
shopt -s dotglob
groupadd onemanband
for user_folder in services/*; do
    u=$(basename "$user_folder")
    useradd "$u" -g onemanband -m
    for f in userstuff/*; do
        f=$(basename "$f")
        cp userstuff/"$f" /home/"$u"/
        chsh "$u" -s /bin/bash
        chown "$u" /home/"$u"/"$f"
        chgrp onemanband /home/"$u"/"$f"
    done
done