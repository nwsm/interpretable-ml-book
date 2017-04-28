#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "christoph.molnar@gmail.com"
git config --global user.name "Christoph Molnar"

git clone  -b master https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git xai-book
cd xai-book
git add --all *
git commit -m"Update book" || true
git push -q origin master