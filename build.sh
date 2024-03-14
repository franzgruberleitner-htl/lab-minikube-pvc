#!/usr/bin/bash

./env.sh

mvn -B package
cp src/main/docker/Dockerfile target/

export GITHUB_ACTOR=franzgruberleitner-htl
export GITHUB_TOKEN=ZnJhbnpncnViZXJsZWl0bmVyLWh0bDpnaHBfOXdGSVQ3ZnBKNXpGeHpwOWFWd0xYNnFnUjdBOUlvM2dTYWRW
export GITHUB_REPOSITORY=franzgruberleitner-htl

docker login ghcr.io -u $GITHUB_ACTOR  -p $GITHUB_TOKEN
docker build --tag ghcr.io/$GITHUB_REPOSITORY/backend:latest ./target
docker push ghcr.io/$GITHUB_REPOSITORY/backend:latest


