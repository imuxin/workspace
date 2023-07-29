# WORKSPACE

```shell
git clone --recursive https://github.com/imuxin/workspace.git
```

- nvim

```shell
# build
make build-alpine # or make build-ubuntu

# run
make run-alpine # or make run-ubuntu
```

```fish
function svim
  docker run -ti --rm \
    --network host \
    -v $(realpath "$PWD"):$PWD/workspace \
    -w $(realpath "$PWD/workspace") \
    slic/nvim:ubuntu \
    nvim $argv
end
```