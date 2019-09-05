# nessus-docker
My nessus docker image

## Build
* download nessus image from https://www.tenable.com/downloads/nessus (eg Nessus-8.6.0-debian6_amd64.deb)
* append to this folder
```
docker build -t adioss/nessus-scanner:8.6.0 . 
```

## Start
```
docker run -d –-name nessus-scanner -p 8834:8834 adioss/nessus-scanner:8.6.0
// then go to: https://localhost:8834 and do the init steps
docker stop
docker cp nessus-scanner:/opt/nessus/var/nessus /local/path
docker rm nessus-scanner 
docker run -d –-name nessus-scanner -v /local/path:/opt/nessus/var/nessus -p 8834:8834 adioss/nessus-scanner:8.6.0
```
