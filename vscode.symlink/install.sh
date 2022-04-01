#!/bin/sh
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

if [ ! -f ~/Library/Application\ Support/Code/User/settings.json ]; then
  ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
else
  rm ~/Library/Application\ Support/Code/User/settings.json
  ln -s ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
fi


if test "$(which code)"; then
  code --install-extension cssho.vscode-svgviewer
  code --install-extension DavidAnson.vscode-markdownlint
  code --install-extension dracula-theme.theme-dracula
  code --install-extension eamodio.gitlens
  code --install-extension EditorConfig.EditorConfig
  code --install-extension golang.go
  code --install-extension hashicorp.terraform
  code --install-extension hediet.vscode-drawio
  code --install-extension jmMeessen.jenkins-declarative-support
  code --install-extension ms-azure-devops.azure-pipelines
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance
  code --install-extension redhat.ansible
  code --install-extension redhat.java
  code --install-extension redhat.vscode-commons
  code --install-extension redhat.vscode-xml
  code --install-extension redhat.vscode-yaml
  code --install-extension RescueTime.rescuetime
  code --install-extension sonarsource.sonarlint-vscode
  code --install-extension VisualStudioExptTeam.vscodeintellicode
  code --install-extension vscjava.vscode-java-debug
  code --install-extension vscjava.vscode-java-dependency
  code --install-extension vscjava.vscode-java-pack
  code --install-extension vscjava.vscode-java-test
  code --install-extension vscjava.vscode-maven
  code --install-extension vscjava.vscode-spring-initializr
  code --install-extension vscode-icons-team.vscode-icons
  code --install-extension WakaTime.vscode-wakatime
  code --install-extension wholroyd.HCL
  code --install-extension wholroyd.jinja
  code --install-extension xyz.local-history
fi


