KEYFILE=/home/ted/Documents/secrets/blurbcloud_rsa
REMOTE_PRIORY_ROOT=/home/priory
rsync -e "ssh -i '$KEYFILE'" -rA --delete . root@blurb.cloud:$REMOTE_PRIORY_ROOT
ssh -i $KEYFILE root@blurb.cloud "export CWD=$REMOTE_PRIORY_ROOT && cd $REMOTE_PRIORY_ROOT && $REMOTE_PRIORY_ROOT/create-users.sh && $REMOTE_PRIORY_ROOT/install-toolchain.sh && $REMOTE_PRIORY_ROOT/install-all-services.sh"