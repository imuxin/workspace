# WORKSPACE

```shell
git clone --recursive https://github.com/imuxin/workspace.git
```

- nvim

```shell
# build
docker build --add-host host.docker.internal:172.17.0.1  . -t slic/nvim:latest -f Dockerfiles/nvim.Dockerfile

# run
docker run -ti --add-host host.docker.internal:172.17.0.1 --rm slic/nvim sh
```