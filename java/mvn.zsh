#!/usr/bin/env zsh

# mvn-color based on https://gist.github.com/1027800
BOLD=$(tput bold)
TEXT_RED=$(tput setaf 1)
TEXT_GREEN=$(tput setaf 2)
TEXT_YELLOW=$(tput setaf 3)
TEXT_BLUE=$(tput setaf 4)
RESET_FORMATTING=$(tput sgr0)


# Wrapper function for Maven's mvn command.
mvn-color()
{
  # Filter mvn output using sed.
  # Before filtering set the locale to C, so invalid characters won't break some sed implementations
  unset LANG
  LC_CTYPE=C mvn "$@" | sed -e "s/\(INFO\)/${BOLD}${TEXT_BLUE}\1${RESET_FORMATTING}/g" \
               -e "s/\(BUILD SUCCESS\)/${BOLD}${TEXT_GREEN}\1${RESET_FORMATTING}/g" \
               -e "s/\(BUILD FAILURE\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
               -e "s/\(WARNING\)/${BOLD}${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
               -e "s/\(ERROR\)/${BOLD}${TEXT_RED}\1${RESET_FORMATTING}/g" \
               -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${BOLD}${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${BOLD}${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${BOLD}${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${BOLD}${TEXT_YELLOW}\4${RESET_FORMATTING}/g"
  MVN_EXIT=${pipestatus[1]}

  local message="${PWD##*/}"
  if [ "$MVN_EXIT" = 0 ]; then
    message="$message BUILD SUCCESS!"
  else
    message="$message BUILD FAILURE!"
  fi

  which terminal-notifier > /dev/null && terminal-notifier -message "$message"
  which notify-send > /dev/null && notify-send "$message"

  # Make sure formatting is reset
  echo -ne "${RESET_FORMATTING}"
}

# Override the mvn command with the colorized one.
alias mvn="mvn-color"
