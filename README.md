# WORKSPACE

```shell
git clone --recursive https://github.com/imuxin/workspace.git
```

- nvim

```shell
# build
docker build --add-host host.docker.internal:172.17.0.1  . -t slic/nvim:latest -f Dockerfiles/nvim.Dockerfile

# build based on ubuntu
docker build --add-host host.docker.internal:172.17.0.1  . -t slic/nvim:ubuntu -f Dockerfiles/nvim-ubuntu.Dockerfile

# run
docker run -ti --add-host host.docker.internal:172.17.0.1 --rm slic/nvim sh
```

```fish
function svim
  docker run -ti --rm \
    --add-host host.docker.internal:172.17.0.1 \
    -v $(realpath "$PWD"):$PWD/workspace \
    -w $(realpath "$PWD/workspace") \
    slic/nvim:ubuntu \
    nvim $argv
end
```