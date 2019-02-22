#!/bin/bash
# -*- Mode: Bash; tab-width: 2; indent-tabs-mode: nil -*- vim:sta:et:sw=2:ts=2:syntax=sh
#
# $Id: shell-script-template.sh 2263 2016-09-17 19:21:59Z jim $
# $Date: 2016-09-17 15:21:59 -0400 (Sat, 17 Sep 2016) $
# $HeadURL: svn+ssh://svn.wtfo-guru.com/var/lib/svn/wtfopuppet/branches/wip4/templates/shell-script-template.sh $
#
# Revision History:
# 20190221 - que - initial version
#

SCRIPT=$(basename "$0")
VERSION='$Revision: 2263 $'
VERBOSE=0
DEBUG=0
ERRORS=0

function usage {
  cat << EOM
usage: $SCRIPT [-d] [-h] [-v] [-V] -c codename(s) debfile
  where:
    -c specify one or more codenames separated by ,
    -d specify debug mode
    -h show this message and exit
    -v add verbosity
    -V show version and exit
EOM
  exit 1
}

CODENAMES=''

function add_codename {
  typeset I="$1"
  typeset D="${2:- }" #delimeter could be any char,default space

  if [ -n "$I" ]
  then
    # allow user to use space, comma or semicolon as delimeter and change to ours
    #I=$(echo $I | sed -e "s/ */${DELIMITER}/g" -e "s/[,;]\+/${DELIMITER}/g")
    I=$(perl -e "print join('${D}', split(/[,; ]+/, join(',', @ARGV)))" "$I")
    if [ -n "$CODENAMES" ]
    then
      CODENAMES="$CODENAMES $I"
    else
      CODENAMES="$I"
    fi
  fi
}

while getopts ":c:dhvV" opt
do
  case "$opt" in
    c )
      add_codename "$OPTARG"
    ;;
    d )
      ((DEBUG+=1))
      ((VERBOSE+=1))
    ;;
    h )
      usage
    ;;
    v ) ((VERBOSE+=1)) ;;
    V )
      echo "$SCRIPT VERSION: $(echo $VERSION | awk '{ print $2 }')"
      exit 0
    ;;
    * )
      echo "Unexpected option \"$opt\""
      usage
    ;;
  esac
done
shift $((OPTIND - 1))

if [ -z "$CODENAMES" ]
then
  usage
fi

if [ -z "$1" ]
then
  usage
fi

DEB=$(readlink -f "$1")

cd "$(dirname "$0")/aptrepo" || exit 1

for cn in $CODENAMES
do
  reprepro -Vb . includedeb $cn "$DEB"
done

exit $ERRORS
