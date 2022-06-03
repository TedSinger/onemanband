# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
      . ~/.bashrc
  fi
fi

mesg n || true

loginctl enable-linger $USER
export XDG_RUNTIME_DIR=/run/user/$(id -u)
