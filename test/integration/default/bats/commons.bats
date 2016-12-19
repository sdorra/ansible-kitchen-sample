#!/usr/bin/env bats

@test "only port 22 and 80 should be open" {
  PORTS=$(netstat -lnptu | grep LISTEN | awk '{print $4}' | awk -F':' '{print $NF}' | sort | uniq)
  [ "$(echo -n $PORTS)" = '22 80' ]
}
