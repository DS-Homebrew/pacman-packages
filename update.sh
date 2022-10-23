#!/bin/bash

rm repo/*.pkg.tar.xz*

for PACKAGE in packages/*; do
	cd $PACKAGE
	dkp-makepkg -sr --sign
	cd ../..
done

cp packages/*/*.pkg.tar.xz* repo
cd repo
dkp-repo-add --verify --sign dsh-libs.db.tar.gz *.pkg.tar.xz
