#!/bin/sh
reload_docker() {
  eval "$(docker-machine env default)"
}
reload_docker >/dev/null 2>&1
