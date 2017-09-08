#!/bin/sh
keybase login
KEYBASE_KEY_ID=$(keybase pgp list | sed -n -e 's/^.*ID:  //p')
keybase pgp export -q $KEYBASE_KEY_ID -o ~/keybase.public.key
keybase pgp export -q $KEYBASE_KEY_ID --secret -o ~/keybase.secret.key
gpg --import ~/keybase.public.key
gpg --import ~/keybase.secret.key

# If you need to add your git email to your gpg
#gpg --edit-key {username}@keybase.io
# then adduid

# Update the trust level to don't show warning messages
# gpg --edit-key {username}@keybase.io trust quit

git config --global user.signingkey $(git config --get user.email)
git config --global commit.gpgsign true
git config --global gpg.program $(which gpg)

rm ~/keybase.public.key ~/keybase.secret.key
