#!/bin/bash
cd "$HOME" || exit
for installer in $(tree -if "$CWD"/services/"$USER" | grep '.install$'); do
    echo "$installer"
    "$installer"
done

loginctl enable-linger "$USER"

XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_RUNTIME_DIR

for envvarname in $(cat "$CWD"/services/"$USER"/secrets-to-inherit.txt 2>/dev/null || echo -n); do
    systemctl --user import-environment "$envvarname"
done

for name_eq_value in $(cat "$CWD"/services/"$USER"/vars-to-set.env 2>/dev/null || echo -n); do
    systemctl --user set-environment "$name_eq_value"
done


for service in $(tree -i "$CWD"/services/"$USER" | grep '\.service$'); do
    systemctl --user link "$CWD"/services/"$USER"/"$service"
    systemctl --user enable "$service"
done

systemctl --user daemon-reload

DEFUNCT_SERVICES=$(systemctl --user list-units --state=not-found -o json | jq -r 'map(select(.sub == "running")) | map(.unit) | join("\n")')
for d_service in $DEFUNCT_SERVICES; do
    echo cleaning up defunct service: "$d_service"
    systemctl --user stop "$d_service"
    systemctl --user disable "$d_service"
done

for service in $(tree -i "$CWD"/services/"$USER" | grep '\.service$'); do
    systemctl --user restart "$service"
done
