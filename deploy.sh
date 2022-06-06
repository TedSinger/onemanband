KEYFILE=/home/ted/Documents/secrets/blurbcloud_rsa
REMOTE_ONEMANBAND_ROOT=/home/onemanband
rsync -e "ssh -i '$KEYFILE'" -rA --delete . root@blurb.cloud:$REMOTE_ONEMANBAND_ROOT
ssh -i $KEYFILE root@blurb.cloud "export CWD=$REMOTE_ONEMANBAND_ROOT && cd $REMOTE_ONEMANBAND_ROOT && $REMOTE_ONEMANBAND_ROOT/create-users.sh"
ssh -i $KEYFILE root@blurb.cloud "export CWD=$REMOTE_ONEMANBAND_ROOT && cd $REMOTE_ONEMANBAND_ROOT && $REMOTE_ONEMANBAND_ROOT/install-toolchain.sh"
ssh -i $KEYFILE root@blurb.cloud "export CWD=$REMOTE_ONEMANBAND_ROOT && cd $REMOTE_ONEMANBAND_ROOT && $REMOTE_ONEMANBAND_ROOT/install-all-services.sh"