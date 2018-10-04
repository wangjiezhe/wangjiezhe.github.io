#!/bin/bash
set -ev

git clone https://%{GH_REF} .deploy_git
cd .deploy_git
git checkout master

cd ../
mv .deploy_git/.git/ ./public/

cd ./public

git config user.name wangjiezhe
git config user.email wangjiezhe@gmail.com

git add .
git commit -m "Travis CI Auto Builder at $(date +'%Y-%m-%d %H:%M:%S')"
git push --force --quiet "https://${GH_TOKEN}@{GH_REF}" master:master
