#!/bin/bash

sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y install --no-install-recommends build-essential gdb
sudo pip3 install cpplint

# now update the README.md file
GITHUB_OWNER=$(git config user.name)
GITHUB_REPO_NAME=$(basename -s .git `git config --get remote.origin.url`)
GITHUB_REPO_NAME=$(basename -s .git $(git config --get remote.origin.url))

FIRST_CHAR=$(head -c 1 ./README.md)
if [ "$FIRST_CHAR" = "[" ]
then
    ex -s -c 1m3 -c w -c q ./README.md
    sed -i "3G" ./README.md
    sed -i "s/<OWNER>/$GITHUB_OWNER/g" ./README.md
    sed -i "s/<REPOSITORY>/$GITHUB_REPO_NAME/g" ./README.md
    git add -A
    git commit -m "updted the badges"
    git push origin main
    echo "README.md updated."
elif [ "$FIRST_CHAR" = "#" ]
then
    echo "Already changed."
else
    echo "Not what it should be!"
    exit 1
fi