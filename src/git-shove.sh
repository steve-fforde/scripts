#!/bin/bash

memo=$1
if [ "$memo" == "" ]; then
  memo="work in progress"
fi

git add . || exit 1
git commit -m "$memo" || exit 2
git push || exit 3