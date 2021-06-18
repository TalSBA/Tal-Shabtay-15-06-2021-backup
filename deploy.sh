#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:TalSBA/Tal-Shabtay-15-06-2021.git main:gh-pages

cd -