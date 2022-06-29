#! /bin/bash

function add() {
  t=""
  p="L"

  while [ -n "$1" ]; do
    case $1 in
    -t | --title)
      if [ -z \$2 ]; then
        echo "Option -t|--title Needs a Parameter"
        exit 1
      fi
      t=$2
      shift
      shift
      ;;
    -p | --priority)
      if [ $2 != "L" ] && [ $2 != "M" ] && [ $2 != "H" ]; then
        echo "Option -p|--priority Only Accept L|M|H"
        exit 1
      fi
      p=$2
      shift
      shift
      ;;
    esac
  done
  echo 0,$p,\"$t\" >>tasks.csv
}

case $1 in
add)
  shift
  add "$@"
  ;;
esac
