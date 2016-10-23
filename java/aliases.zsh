#!/bin/sh

mvn() {
  # shellcheck disable=SC2068
  command mvn $@
  local message="'mvn $*' done!"
  which terminal-notifier > /dev/null && terminal-notifier -message "$message"
  which notify-send > /dev/null && notify-send "$message"
}

alias mvnci='mvn clean install -Pformat,production'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnformat='mvn validate -Pformat -fcontaazul-config -o'
alias mvnit='mvn install -B -e -Pproduction,IT -Dit.keepDB -T2C'

alias compile='mvn clean install -DskipTests=true -Pproduction'
alias mtree='mvn dependency:tree'
