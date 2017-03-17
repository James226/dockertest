FROM microsoft/dotnet:1.1-runtime-nanoserver
ARG source
WORKDIR /app
EXPOSE 5000
COPY ${source:-obj/Docker/publish} .
ENTRYPOINT ["dotnet", "dockertest.client.dll"]
