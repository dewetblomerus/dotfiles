FROM ubuntu:16.04

RUN apt update
RUN apt upgrade -y
RUN apt install vim zsh git-core -y
RUN apt install wget -y
RUN adduser dewet
WORKDIR /home/dewet
USER dewet
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
USER root
USER dewet
RUN rm .zshrc
ADD zshrc .zshrc
ADD vimrc .vimrc
ADD gitconfig .gitconfig
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#RUN git config --global user.email "dewet@blomerus.org"
#RUN git config --global user.name "De Wet Blomerus"
#RUN git config --global push.default simple
CMD /usr/bin/zsh
