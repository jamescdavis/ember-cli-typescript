#!/bin/bash

set -e

MD_ONLY==true

CHANGED_FILES=`git diff --name-only master...${TRAVIS_COMMIT}`

for CHANGED_FILE in $CHANGED_FILES; do
  if ! [[ $CHANGED_FILE =~ .md$ ]]; then
    MD_ONLY=false
    break
  fi
done

if [[ $MD_ONLY == true ]]; then
  exit 0
else
  exit 1
fi
