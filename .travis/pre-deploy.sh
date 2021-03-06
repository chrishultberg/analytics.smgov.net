#!/bin/bash

# Deployments respect `.gitignore`, so _site wouldn't be deployed. We have travis find its
# innerself with a git identity, force add the `_site/` directory, and commit it for it to
# be pushed
git config user.name "travis-ci"
git config user.email "travis@localhost"
git add -f _site/
git commit --amend --no-edit