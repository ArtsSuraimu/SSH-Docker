# SSH-Docker

Take an existing Docker image (here example: [NGC](https://ngc.nvidia.com)) and enable SSH access to the container.

## Build
```
git clone https://github.com/twittidai/SSH-Docker.git
cd SSH-Docker
docker build -t tf1-19.10-ssh .
```

## Run
```
docker run --runtime=nvidia -it --rm -p 10022:22 -v $PWD:/workspace tf1-19.10-ssh:latest
```

## Connect
```
ssh -p 10022 root@dockerhost 
#Enter the password nvidia and enjoy
```

## Reference: 
- [Dockerize an SSH service](https://docs.docker.com/engine/examples/running_ssh_service/)
