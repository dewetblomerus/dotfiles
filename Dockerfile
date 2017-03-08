FROM ubuntu:16.04
# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt update
RUN apt upgrade -y
RUN apt install vim-nox zsh git-core -y
RUN apt install wget -y
RUN apt-get -y install software-properties-common && \
    add-apt-repository ppa:tmate.io/archive    && \
    apt-get -y update                             && \
    apt-get -y install tmate
RUN adduser dewet
WORKDIR /home/dewet
USER dewet
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
USER root
RUN chsh -s `which zsh`
USER dewet
RUN rm .zshrc
ADD zshrc .zshrc
ADD vimrc .vimrc
ADD gitconfig .gitconfig
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
CMD /usr/bin/zsh
