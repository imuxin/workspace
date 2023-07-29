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

COPY .curlrc .gitconfig .wgetrc /root/

# install deps
RUN apt install git ripgrep build-essential wget curl universal-ctags unzip zstd python3 python3-venv -y

# install go
RUN apt install golang-${GOVersion} -y \
    && ln -s /usr/lib/go-${GOVersion}/bin/go /usr/local/bin/go

RUN useradd -ms /bin/bash $USER
USER $USER
WORKDIR /home/$USER
COPY --chown=$USER .curlrc .gitconfig .wgetrc $HOME/
COPY --chown=$USER .goenv $HOME/.config/go/env

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

# install nvim
RUN wget https://github.com/neovim/neovim/releases/download/${nvimVersion}/nvim-linux64.tar.gz && tar -zxf nvim-linux64.tar.gz -C ~/ && mv nvim-linux64 ~/.nvim && rm -rf ./nvim-linux64.tar.gz

# install zig
RUN wget https://ziglang.org/download/0.10.1/zig-linux-x86_64-0.10.1.tar.xz && tar xf zig-linux-x86_64-0.10.1.tar.xz && mv zig-linux-x86_64-0.10.1 ~/.zig && rm -rf zig-linux-x86_64-0.10.1.tar.xz

ENV PATH="${PATH}:/home/$USER/.nvim/bin:/home/$USER/.zig"

# setting nvchad config
COPY --chown=$USER NvChad/ $HOME/.config/nvim/
COPY --chown=$USER NvChad-Config/custom-ubuntu/ $HOME/.config/nvim/lua/custom
