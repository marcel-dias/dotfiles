#!/bin/sh

oplogin() {
    echo "$(op signin my)" > ~/.1passrc
    source ~/.1passrc
}

opgetpass() {
    op get item "$1" | jq -r '.details.fields[] | select( .designation | contains("password")).value' | tr -d '\n\t' | pbcopy
}
