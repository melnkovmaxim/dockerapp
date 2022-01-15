FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o out DockerApp/DockerApp.csproj

FROM mcr.microsoft.com/dotnet/aspnet:6.0
EXPOSE 80
WORKDIR /app
COPY --from=build /src/out .

RUN ls -a

ENTRYPOINT [ "dotnet", "DockerApp.dll" ]