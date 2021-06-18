#!/usr/bin/env sh

set -env

npm run build

cd dist

git init
git add -add
git commit -m 'deploy'
git push -f git@github.com:TalSBA/Tal-Shabtay-15-06-2021.git master:gh-pages

cd -