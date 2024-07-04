#!/bin/sh

cd ../
git pull
build_version=$(git rev-parse --short HEAD)
echo "$(TZ='Europe/Amsterdam' date +%FT%T%z): Releasing new server version. $build_version" >> #/mnt/backup/code/github/logs/prod-code02.log
echo "$(TZ='Europe/Amsterdam' date +%FT%T%z): Running build...."
./install.sh