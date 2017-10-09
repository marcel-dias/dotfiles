# gpg-agent
if test -n "$(pgrep gpg-agent)"; then

else
  eval $(gpg-agent --daemon)
fi
