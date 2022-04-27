KEYFILE=/home/ted/Documents/secrets/blurbcloud_rsa
REMOTE_PRIORY_ROOT=/home/blurb/priory
rsync -e "ssh -i '$KEYFILE'" -rA --delete . root@blurb.cloud:$REMOTE_PRIORY_ROOT
ssh -i $KEYFILE root@blurb.cloud "sudo -u blurb CWD=$REMOTE_PRIORY_ROOT $REMOTE_PRIORY_ROOT/install-services.sh"