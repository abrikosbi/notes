# Docker

### First Steps
Command | Description
--- | ---
docker version |
docker info | 
docker list |
docker run hello-world |

### Docker container
Command | Description
--- | ---
docker container --help |
docker container run --publish 80:80 nginx |
docker container run --publish 80:80 --detach nginx |
docker container ls |
docker container ls -a |
docker container stop f0cdc1db624f |
docker container run --publish 80:80 --detach --name webhost nginx |
docker container logs webhost |
docker container top webhost |
docker container --help |
docker container rm 3f3b7ec46384 1dc8ec0d39c3 |
docker container rm -f 8b55d8552d72 |


### Docker build
Command | Description
--- | ---
docker build --help |
docker build -t friendlyhello:newest . |


### Docker machine
Command | Description
--- | ---
docker-machine create --driver virtualbox --virtualbox-boot2docker-url /Users/koskiszz/.docker/machine/cache/v18.06.1-ce/boot2docker.iso myvm1 |


### Приемы
> Note: Because Docker Desktop for Mac and Docker Desktop for Windows use a Linux VM, you need a Linux binary, rather than a Mac or Windows binary. You can use a Docker container to build it:
```bash
$ docker run --rm -it -v $PWD:/build ubuntu:16.04

container# apt-get update && apt-get install build-essential
container# cd /build
container# gcc -o hello -static -nostartfiles hello.c
```
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
Docker has the ability to build images by piping Dockerfile through stdin with a local or remote build context
```bash
echo -e 'FROM busybox\nRUN echo "hello world"' | docker build -
# OR
docker build -<<EOF
FROM busybox
RUN echo "hello world"
EOF
```
