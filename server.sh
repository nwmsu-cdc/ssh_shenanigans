podman build -f ./server -t serverssh ; podman run --net test --name server --hostname server --replace -it serverssh
