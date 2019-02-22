#!/bin/bash

rsync -Orlptv --delete --exclude=robots.txt --exclude=incoming/ aptrepo/ rsync://roc/aptrepos/

