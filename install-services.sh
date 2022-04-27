#!/bin/sh
loginctl enable-linger $USER
export XDG_RUNTIME_DIR=/run/user/$(id -u)

systemctl --user link $CWD/services/*/*.service
systemctl --user enable $(tree -i $CWD | grep '\.service$')

systemctl --user daemon-reload

systemctl --user restart $(tree -i $CWD | grep '\.service$')