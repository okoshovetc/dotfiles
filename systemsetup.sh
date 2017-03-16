#!/bin/bash

ROOT_UID=0
install_list="
	audacity
	build-essential
	cheese
	cmake
	g++
	gcc
	gcl
	git
	htop
	nmon
	perl
	pinta
	playonlinux
	qbittorrent
	screen
	steam
	tmux
	virtualbox-qt
	vim
	vlc
"
libs_list="
	g++-multilib
	gcc-multilib
	libasound2-dev:i386
	libfreetype6-dev:i386
	libglu1-mesa:i386
	libgnutls28-dev:i386
	libgsm1-dev:i386
	libgtk2.0-0:i386
	libjpeg8-dev:i386
	liblcms2-dev:i386
	libldap2-dev:i386
	libmpg123-dev:i386
	libopenal-dev:i386
	libopenal1:i386
	libsdl-image1.2:i386
	libsdl-ttf2.0-0:i386
	libv4l-dev:i386
	libx11-dev:i386
	libxinerama-dev:i386
	libxml2-dev:i386
	libxrender-dev:i386
	libxrender1-dbg:i386
	libxslt1-dbg:i386
	libxslt1-dev:i386
	zlib1g-dev:i386
"

if [ $UID -ne $ROOT_UID ]
then
	echo "Root rights needed"
else
	add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
	apt-get update
	apt-get install $install_list
	apt-get install $libs_list
	apt-get upgrade
fi
