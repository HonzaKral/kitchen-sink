#!/usr/bin/env bats

@test "Simple" {
  run cat /etc/passwd
  [ "$status" -eq 0 ]
}

@test "testing is here" {
  run bash -c "cat /tmp/testing | grep -q Hello"
  [ "$status" -eq 0 ]
}
