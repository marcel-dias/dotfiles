#!/bin/sh

oplogin() {
    echo "$(op signin my)" > ~/.1passrc
    source ~/.1passrc
}

opgetpass() {
    op get item "$1" | jq '.details.password' | sed 's/"//g' | sed 's/\r\n//g' | pbcopy
}
