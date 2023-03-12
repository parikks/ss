#!/usr/bin/env bash

cd $WORKDIR
mkdir -p ~/.config/rclone
echo "$RCLONECONFIG_DRIVE" > ~/.config/rclone/rclone.conf
name_rom=AOSPA
device=lmi
rclone copy --drive-chunk-size 256M --stats 1s drive:ccache/$name_rom/$device/ccache.tar.gz $WORKDIR -P
tar xzf ccache.tar.gz
rm -rf ccache.tar.gz