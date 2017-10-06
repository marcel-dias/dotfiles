#!/bin/sh

oplogin() {
    eval "$(op signin my)"
}

opgetpass() {
    op get item "$1" | jq '.details.password' | sed 's/"//g' | sed 's/\r\n//g' | pbcopy
}
