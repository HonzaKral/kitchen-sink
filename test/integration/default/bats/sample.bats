#!/usr/bin/env bats

@test "Simple" {
  run cat /etc/passwd
  [[ "$status" == 0 ]]
}

@test "testing is here" {
  run bash -c "cat /tmp/testing | grep -q Hello"
  [[ "$status" == 0 ]]
}

@test "elasticsearch is running" {
  run curl -s -o /dev/null -w '%{http_code}' -X GET http://localhost:9200
  [[ "$output" == 200 ]]
}

@test "elasticsearch node name is set correctly" {
  run bash -c "curl -sX GET 'http://localhost:9200/_cat/nodes?h=name'"
  [[ "$output" == "node1 " ]]
}
