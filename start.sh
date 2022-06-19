#!/bin/bash

source ~/.profile

if [[ ! -e /Users/oaizab/goinfre/.npm-global ]]; then
	echo "mkdir /Users/oaizab/goinfre/.npm-global"
	mkdir /Users/oaizab/goinfre/.npm-global
fi


# if [[ ! -e /Users/oaizab/goinfre/.npm-global/bin/parcel ]]; then
# 	echo "npm install --global parcel"
# 	npm install --global parcel
# fi

if [[ ! -e /Users/oaizab/goinfre/Library ]]; then
	echo "mkdir /Users/oaizab/goinfre/Library"
	mkdir /Users/oaizab/goinfre/Library
fi

if [[ ! -e /Users/oaizab/goinfre/Applications ]]; then
	echo "mkdir /Users/oaizab/goinfre/Applications"
	mkdir /Users/oaizab/goinfre/Applications
	temp=$TMPDIR$(uuidgen)
	mkdir -p $temp/mount
	curl https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg > $temp/1.dmg
	yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
	cp -r $temp/mount/*.app ~/goinfre/Applications
	hdiutil detach $temp/mount
	rm -r $temp
	temp=$TMPDIR$(uuidgen)
	mkdir -p $temp/mount
	curl https://release.axocdn.com/darwin/installGitKraken.dmg > $temp/1.dmg
	yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
	cp -r $temp/mount/*.app ~/goinfre/Applications
	hdiutil detach $temp/mount
	rm -r $temp
	temp=$TMPDIR$(uuidgen)
	mkdir -p $temp/mount
	curl https://dl.discordapp.net/apps/osx/0.0.267/Discord.dmg > $temp/1.dmg
	yes | hdiutil attach -noverify -nobrowse -mountpoint $temp/mount $temp/1.dmg
	cp -r $temp/mount/*.app ~/goinfre/Applications
	hdiutil detach $temp/mount
	rm -r $temp
fi


if [[ ! -e /Users/oaizab/goinfre/homebrew ]]; then
	echo "mkdir /Users/oaizab/goinfre/homebrew"
	mkdir ~/goinfre/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/goinfre/homebrew
	source ~/.zshrc
	brew tap LouisBrunner/valgrind
	brew install --HEAD LouisBrunner/valgrind/valgrind
	brew install readline
	brew install htop
fi