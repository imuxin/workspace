ARG ubuntuVersion=jammy

FROM ubuntu:${ubuntuVersion}
ARG GOVersion=1.20
ARG nvimVersion=v0.9.0

LABEL maintainer="imuxin <chengqinglin@icloud.com>"

ENV USER=muxin
ENV HOME=/home/$USER

# 切换镜像源
RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list \
    && apt update

RUN apt install git ripgrep build-essential wget curl universal-ctags unzip -y

RUN apt install golang-${GOVersion} -y \
    && ln -s /usr/lib/go-${GOVersion}/bin/go /usr/local/bin/go

RUN useradd -ms /bin/bash $USER
USER $USER
WORKDIR /home/$USER
COPY --chown=$USER .curlrc $HOME/
COPY --chown=$USER .gitconfig $HOME/
COPY --chown=$USER .wgetrc $HOME/
COPY --chown=$USER .goenv $HOME/.config/go/env

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
RUN wget https://github.com/neovim/neovim/releases/download/${nvimVersion}/nvim-linux64.tar.gz && tar -zxf nvim-linux64.tar.gz -C ~/ && mv nvim-linux64 ~/.nvim && rm -rf ./nvim-linux64.tar.gz

ENV PATH="${PATH}:/home/$USER/.nvim/bin"

COPY --chown=$USER NvChad/ $HOME/.config/nvim/
COPY --chown=$USER NvChad-Config/custom/ $HOME/.config/nvim/lua/custom
