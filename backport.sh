#!/bin/bash

set -e

if [[ ($# != 1) ]]
then
  echo "missing <commit-sha>"
  exit 1
fi

commit_sha=$1

git fetch --no-tags https://github.com/openjdk/jdk $commit_sha
git cherry-pick --no-commit $commit_sha

# then: commit all changes
# 8253638: Cleanup os::reserve_memory and remove MAP_FIXED
# Backport 625a9352bfdc017f426c3bd2a5c24b0f7598ccce

# then: fix and commit changes
# fixup! 8253638: Cleanup os::reserve_memory and remove MAP_FIXED
