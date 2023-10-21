# Download Steam client
FROM cm2network/steamcmd:latest AS steam

FROM alpine as build

WORKDIR /assettoserver

RUN apk add wget && \
    wget https://github.com/compujuckel/AssettoServer/releases/download/v0.0.52/assetto-server-linux-x64.tar.gz && \
    tar xvf assetto-server-linux-x64.tar.gz --no-same-owner --no-same-permissions && \
    rm assetto-server-linux-x64.tar.gz

FROM mcr.microsoft.com/dotnet/aspnet:7.0

WORKDIR /app

COPY --from=steam /home/steam/steamcmd/linux64/ /root/.steam/sdk64/
COPY --from=build assettoserver/ .

WORKDIR /data

ENTRYPOINT ["/app/AssettoServer", "--plugins-from-workdir"]