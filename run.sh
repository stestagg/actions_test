#!/bin/sh

apk add tree
tree -a

TOKEN_URL=$(git remote get-url origin | sed s/https/http/)
git remote set-url origin $TOKEN_URL

git pull origin master
