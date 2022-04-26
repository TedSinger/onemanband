loginctl enable-linger $USER
export XDG_RUNTIME_DIR=/run/user/$(id -u)

systemctl --user link $(pwd)/services/*/*.service
systemctl --user enable $(tree -i | grep '\.service$')

systemctl --user daemon-reload

# systemctl --user restart blurbcloud.service