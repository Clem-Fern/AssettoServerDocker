# AssettoServerDocker
assettoserver.org docker compose
Version: 0.0.52

### Quick Startup
```
git clone https://github.com/Clem-Fern/AssettoServerDocker.git
cd AssettoServerDocker
docker compose up
```

### Volume
`.data` folder contains all server's related stuff. You have to extract your server pack in here.

You can create as much server's data folder as you want/need. 

```yml
    # Simply edit `docker-compose.yml` and replace data folder by the one corresponding to your server pack.
    volumes:
      #- ./data:/data
      - ./la_canyons:/data
```
