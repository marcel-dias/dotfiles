#!/bin/sh

alias mvnci='mvn clean install'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'

alias compile='mvn clean install -DskipTests=true'
alias mtree='mvn dependency:tree'
alias mvnd='mvn dependency:resolve'
