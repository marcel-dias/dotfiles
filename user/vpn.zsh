#!/usr/bin/env zsh

vpn-connect() {
  open "https://db-login.glovoapp.com/"
  osascript -e 'tell application "Viscosity" to connect "glovo_vpn_config"'
}
