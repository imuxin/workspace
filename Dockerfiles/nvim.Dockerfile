ARG alpineVersion=3

FROM alpine:${alpineVersion}

ENV USER=muxin
ENV HOME=/home/$USER

LABEL maintainer="imuxin <chengqinglin@icloud.com>"

# 切换镜像源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add git neovim ripgrep build-base wget ctags go rust cargo --update

RUN go env -w GOPROXY=https://goproxy.cn,direct

RUN addgroup -S $USER && adduser -S $USER -G $USER
USER $USER
WORKDIR /home/$USER

COPY --chown=$USER .gitconfig $HOME/
COPY --chown=$USER .wgetrc $HOME/
COPY --chown=$USER NvChad/ $HOME/.config/nvim/
COPY --chown=$USER NvChad-Config/custom/ $HOME/.config/nvim/lua/custom
