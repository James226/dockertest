#!/usr/bin/env bash
dotnet restore dockertest.sln
dotnet build -c Release dockertest/dockertest.csproj
dotnet publish -c Release -o obj/Docker/publish dockertest/dockertest.csproj
docker build -t james226/dockertest:$TRAVIS_BUILD_NUMBER dockertest
