#!/usr/bin/env bash

if [ -z $1 ]
then
    exit
fi

unsafe="^A-Za-z0-9\-\._~/()!*"
perl -MURI::Escape -e 'print uri_escape($ARGV[0], $ARGV[1]);' "$1" "$unsafe"

