# WORKSPACE

```shell
git clone --recursive https://github.com/imuxin/workspace.git
```

- nvim

```shell
# build
docker build --network=host  . -t slic/nvim-build:alpine -f Dockerfiles/nvim.Dockerfile

# build based on ubuntu
docker build --network=host  . -t slic/nvim-build:ubuntu -f Dockerfiles/nvim-ubuntu.Dockerfile

# run
docker run -ti --network=host --rm slic/nvim-build:alpine bash
docker run -ti ---network=host --rm slic/nvim-build:ubuntu bash
```

```fish
function svim
  docker run -ti --rm \
    --add-host localhost:172.17.0.1 \
    -v $(realpath "$PWD"):$PWD/workspace \
    -w $(realpath "$PWD/workspace") \
    slic/nvim:ubuntu \
    nvim $argv
end
```