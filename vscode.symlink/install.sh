#!/bin/sh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

if test "$(which code)"; then
    code --install-extension webstp.extension-manager
    code --install-extension DavidAnson.vscode-markdownlint
    code --install-extension PeterJausovec.vscode-docker
    code --install-extension dracula-theme.theme-dracula
    code --install-extension ms-vscode.azure-account
    code --install-extension redhat.java
    code --install-extension vscjava.vscode-java-debug
    code --install-extension vscjava.vscode-java-pack
    code --install-extension WakaTime.vscode-wakatime
    code --install-extension jmMeessen.jenkins-declarative-support
    code --install-extension vscoss.vscode-ansible
fi
