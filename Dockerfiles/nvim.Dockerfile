ARG alpineVersion=edge

FROM alpine:${alpineVersion}

ENV USER=muxin
ENV HOME=/home/$USER
ENV PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

LABEL maintainer="imuxin <chengqinglin@icloud.com>"

# 切换镜像源
COPY apk.repositories /etc/apk/repositories
COPY --chown=$USER .gitconfig .wgetrc .curlrc $HOME/
COPY .gitconfig .wgetrc .curlrc /root/
COPY --chown=$USER .goenv $HOME/.config/go/env

# install deps
RUN apk add bash git neovim ripgrep build-base wget ctags go rust cargo zig zstd --update

# install zls(zig language server)
RUN mkdir /zls && cd /zls && wget https://github.com/zigtools/zls/releases/download/0.10.0/x86_64-linux.tar.zst && zstd -d x86_64-linux.tar.zst && tar -xvf x86_64-linux.tar && mv ./bin/zls /usr/local/bin/zls && cd / && rm -rf /zls

# add USER
RUN addgroup -S $USER && adduser -S $USER -G $USER
USER $USER
WORKDIR /home/$USER

# setting nvchad config
COPY --chown=$USER NvChad/ $HOME/.config/nvim/
COPY --chown=$USER NvChad-Config/custom-alpine/ $HOME/.config/nvim/lua/custom
