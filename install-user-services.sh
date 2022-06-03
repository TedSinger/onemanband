#!/bin/sh
echo install-user-services $USER
cd
for installer in $(tree -if $CWD/services/$USER | grep 'install.sh$'); do
    echo $installer
    $installer
done

loginctl enable-linger $USER
export XDG_RUNTIME_DIR=/run/user/$(id -u)


for envvarname in $(cat $CWD/services/$USER/secrets-to-inherit.txt 2>/dev/null || echo -n); do
    systemctl --user import-environment $envvarname
done

for name_eq_value in $(cat $CWD/services/$USER/vars-to-set.env 2>/dev/null || echo -n); do
    systemctl --user set-environment $name_eq_value
done

systemctl --user link $CWD/services/$USER/*/*.service
systemctl --user enable $(tree -i $CWD/services/$USER | grep '\.service$')

systemctl --user daemon-reload

systemctl --user restart $(tree -i $CWD/services/$USER | grep '\.service$')

echo restarted services for $USER