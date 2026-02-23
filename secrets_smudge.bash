#!/bin/bash
if [ $# -gt 0 ]; then
  if [ ! -e secrets ]; then
    secrets="$(age -d -i ~/.ssh/id_ed25519 secrets.age)"

    if $?; then
      echo "$secrets" > secrets
    else
      >&2 echo "Failed to decrypt secrets"
      exit 1
    fi
  fi

  output="$(</dev/stdin)"
  while read -r secret_line; do
    name=${secret_line%%=*}
    value=${secret_line#*=}

    if [ "$1" = "clean" ]; then
      output="${output//$value/$name}"
    elif [ "$1" = "smudge" ]; then
      output="${output//$name/$value}"
    fi
  done <secrets

  if [ "$output" != "" ]; then
    echo "$output"
    exit 0
  fi
fi

>&2 echo "Unknown action, please use either filter or smudge"
exit 1
