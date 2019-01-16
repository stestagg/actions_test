#!/bin/sh

apk add tree
tree -a

TOKEN_URL=$(git remote get-url origin | sed s/github.com/$GITHUB_TOKEN@github.com/)
git remote set-url origin $TOKEN_URL

git checkout test
echo HI > a.txt
git add a.txt
git commit -m auto test

git push
