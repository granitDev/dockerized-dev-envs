docker stop dev
docker rm dev
docker rmi devimg
docker build . -t devimg
docker-compose up