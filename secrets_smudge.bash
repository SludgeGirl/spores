#!/bin/bash
if [ $# -gt 0 ]; then
  if [ ! -e secrets ]; then
    secrets="$(age -d -i ~/.ssh/id_ed25519 secrets.age)"

    if [ "$?" = "0" ]; then
      echo "$secrets" > secrets
    else
      >&2 echo "Failed to decrypt secrets"
      exit 1
    fi
  fi

  output="$(</dev/stdin)"
	if [ "$1" = "clean" ]; then
    while read secret_line; do
      name=${secret_line%%=*}
      value=${secret_line#*=}

      output="$(echo "$output" | sed -e "s/$value/$name/g")"
    done <secrets
	elif [ "$1" = "smudge" ]; then
    while read secret_line; do
      name=${secret_line%%=*}
      value=${secret_line#*=}

      output="$(echo "$output" | sed -e "s/$name/$value/g")"
    done <secrets
	fi

	if [ "$output" != "" ]; then
	  echo "$output"
	  exit 0
	fi
fi

>&2 echo "Unknown action, please use either filter or smudge"
exit 1
