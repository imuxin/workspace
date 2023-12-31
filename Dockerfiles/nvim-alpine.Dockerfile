ARG alpineVersion=edge

FROM alpine:${alpineVersion}

ENV PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

LABEL maintainer="imuxin <chengqinglin@icloud.com>"

# 切换镜像源
COPY apk.repositories /etc/apk/repositories
COPY .gitconfig .wgetrc .curlrc /root/

# install deps
RUN apk add bash git neovim ripgrep build-base curl wget gzip unzip cmake ctags go zig zstd protoc lua5.1 --update

# install zls(zig language server)
RUN mkdir /zls && cd /zls && wget https://github.com/zigtools/zls/releases/download/0.10.0/x86_64-linux.tar.zst && zstd -d x86_64-linux.tar.zst && tar -xvf x86_64-linux.tar && mv ./bin/zls /usr/local/bin/zls && cd / && rm -rf /zls

# add protoc include files
COPY protoc-23.4/include/* /usr/include/google/
COPY protoc-23.4/bin/protoc /usr/local/bin/

# add USER
ENV USER=muxin
ENV HOME=/home/$USER
RUN addgroup -S -g 1000 $USER && adduser -S $USER -G $USER -u 1000
USER $USER
WORKDIR /home/$USER
COPY --chown=$USER .goenv $HOME/.config/go/env
COPY --chown=$USER .gitconfig .wgetrc .curlrc .bashrc $HOME/

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

ENV PATH="${PATH}:/home/$USER/.cargo/bin"

# setting nvchad config
COPY --chown=$USER NvChad/ $HOME/.config/nvim/
COPY --chown=$USER NvChad-Config/custom-alpine/ $HOME/.config/nvim/lua/custom
