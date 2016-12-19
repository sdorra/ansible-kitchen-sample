#!/usr/bin/env bats

@test "webserver is running an prints hello world" {
  curl -s localhost | grep 'Hello world' 2>&1 > /dev/null
}
