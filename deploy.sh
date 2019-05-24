#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa

  cd public
  git init

  git remote add deploy "travis@johncosio.com:/home/web/app/prod/hugo-jcos.io"
  git config user.name "Travis CI"
  git config user.email "mail@jcos.io"

  git add .
  git commit -m "Deployed with Travis"
  git push --force deploy master
else
  echo "Not deploying, since this branch isn't master."
fi
