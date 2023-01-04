docker stop rgp
docker rm rgp
docker rmi rgpimg
docker build . -t rgpimg
docker-compose up
