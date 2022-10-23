#!/bin/bash

rm repo/*

for PACKAGE in packages/*; do
	cd $PACKAGE
	dkp-makepkg --sign
	cd ../..
done

mv packages/*/*.pkg.tar.xz* repo
cd repo
dkp-repo-add --verify --sign dsh-libs.db.tar.gz *.pkg.tar.xz
cd ..
