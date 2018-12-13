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
