#! /usr/bin/bash

read -p "Enter your logname: " name
home_dir=$(grep $name /etc/passwd | cut -d: -f6)
ls -l $home_dir
ps -u $name
cp -r $home_dir /tmp
