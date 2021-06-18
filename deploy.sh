#!/usr/bin/env sh

set -env

npm run build

cd dist

git init
git add -add
git commit -m 'New Deployment'
git push -f git@github.com:TalSBA/Tal-Shabtay-15-06-2021.git main:gh-pages

cd -