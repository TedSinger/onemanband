rsync -e "ssh -i '/home/ted/Documents/secrets/blurbcloud_rsa'" -rA --delete . root@blurb.cloud:/home/blurb/priory
ssh -i '/home/ted/Documents/secrets/blurbcloud_rsa' root@blurb.cloud 'sudo -u blurb CWD=/home/blurb/priory /home/blurb/priory/install-services.sh'