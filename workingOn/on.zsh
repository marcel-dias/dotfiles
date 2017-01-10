#!/bin/sh
on() {
  noglob curl -X POST --data-urlencode "task=$*" https://api.workingon.co/hooks/incoming?token=$WORKINGON_TOKEN >/dev/null 2>&1 echo "Task sent to WorkingOn."
}
