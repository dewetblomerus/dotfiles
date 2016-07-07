#!/bin/bash
FOLDERS=(bin code dewetblomerus.github.io Documents Downloads Dropbox Music Pictures Public Templates Videos VirtualBox-VMs);
SSDPATH=/media/dewet/ssd
for i in ${FOLDERS[@]}
do
  rm -f ~/$i
  ln -s $SSDPATH/$i ~/$i
done
