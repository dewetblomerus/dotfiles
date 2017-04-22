#!/bin/bash

apt install curl openssh-server ca-certificates postfix -y
dpkg -i gitlab-*
gitlab-ctl reconfigure
