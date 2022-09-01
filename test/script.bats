#!/usr/bin/env bats

@test "aws cli installed" {
  result=$(aws -h)
  [ "$?" -eq 0 ]
}

@test "tar installed" {
  result=$(tar --version)
  [ "$?" -eq 0 ]
}
