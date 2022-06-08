# One-Man Band

This repo is how I organize and deploy services to my VPS. With the suitable RSA key and `secrets.env` file, `./deploy.sh blurb.cloud` will:
* `rsync` these files into the VPS
* install tools owned by `root` (see `toolchain`)
* run all the checks in `checks/` and abort if they have output (which is saved)
* create and configure users for the services
* checkout and install each project (possibly installing user-space dependencies)
* set `systemd` environment variables
* enable and (re-)start all the `systemd` unit files, under their respective users
