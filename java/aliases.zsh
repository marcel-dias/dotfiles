#!/bin/sh

alias mvnci='mvn clean install'
alias mvnd='mvn deploy'
alias mvnp='mvn package'
alias mvnc='mvn clean'
alias mvncom='mvn compile'
alias mvnt='mvn test'
alias mvnvs='mvn versions:set' #-DnewVersion=

alias compile='mvn clean package -DskipTests=true'
alias mtree='mvn dependency:tree'
alias mvnd='mvn dependency:resolve'
