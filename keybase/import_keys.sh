#!/bin/sh
keybase login
keybase pgp pull $(keybase whoami)

KEYBASE_KEY_ID=$(keybase pgp list | sed -n -e 's/^.*ID:  //p')
keybase pgp export -q $KEYBASE_KEY_ID | gpg --import
keybase pgp export -q $KEYBASE_KEY_ID --secret | gpg --import --allow-secret-key-import

# If you need to add your git email to your gpg
#gpg --edit-key $(keybase whoami)@keybase.io
# then adduid

echo "Update the trust level to don't show warning messages"
gpg --edit-key $(keybase whoami)@keybase.io trust quit

# keybase pgp update

git config --global user.signingkey $(git config --get user.email)
git config --global commit.gpgsign true
git config --global gpg.program $(which gpg)
