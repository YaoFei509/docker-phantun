#!/bin/bash

VER=`curl -sL https://api.github.com/repos/dndx/phantun/releases  | jq -r '[.[] | select(.prerelease == false) | select(.draft == false) | .tag_name] | .[0]'`

AR="${1:-`arch`}"

case "$AR" in 
	"armv7")
		TGT="phantun_armv7-unknown-linux-musleabihf.zip"
		;;

	"aarch64")
		TGT="phantun_aarch64-unknown-linux-musl.zip"
		;;
			
	"x86_64")
		TGT="phantun_x86_64-unknown-linux-musl.zip"
		;;	
esac

curl -Ls https://github.com/dndx/phantun/releases/download/$VER/$TGT -o p.zip
unzip p.zip
mv -f phantun_client phantun_client_$AR
rm -f phantun_server p.zip

#https://github.com/dndx/phantun/releases/download/v0.8.1/phantun_x86_64-unknown-linux-musl.zip
