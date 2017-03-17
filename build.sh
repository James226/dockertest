#!/usr/bin/env bash
pip install --upgrade awscli
dotnet restore dockertest.sln
dotnet build -c Release dockertest/dockertest.csproj
dotnet publish -c Release -o obj/Docker/publish dockertest/dockertest.csproj
docker build -t james226/dockertest:latest dockertest -f dockertest/Dockerfile.linux
eval $(aws ecr get-login --region eu-west-1)
docker tag james226/dockertest:latest 691267057566.dkr.ecr.eu-west-1.amazonaws.com/james226/dockertest:$TRAVIS_BUILD_NUMBER-linux
docker push 691267057566.dkr.ecr.eu-west-1.amazonaws.com/james226/dockertest:$TRAVIS_BUILD_NUMBER-linux