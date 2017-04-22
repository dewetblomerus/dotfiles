FROM ubuntu:16.04
# Basics
RUN apt update
RUN apt upgrade -y
RUN apt install vim-nox zsh git-core locales sudo wget docker.io -y
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
# Tmate
RUN apt-get -y install software-properties-common && \
    add-apt-repository ppa:tmate.io/archive    && \
    apt-get -y update                             && \
    apt-get -y install tmate
# Zshell
RUN adduser dewet
WORKDIR /home/dewet
USER dewet
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
USER root
RUN chsh -s `which zsh`
# Dotfiles
USER dewet
RUN rm .zshrc
ADD zshrc .zshrc
ADD vimrc .vimrc
ADD gitconfig .gitconfig
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN vim -c 'PluginInstall' -c 'qa!'
# Run docker command without Sudo
USER root
RUN groupmod -g 999 docker
RUN gpasswd -a dewet docker
RUN echo "dewet:;lkjasdf" | chpasswd
RUN adduser dewet sudo
USER dewet
CMD /usr/bin/zsh
