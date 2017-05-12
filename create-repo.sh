#! /usr/bin/env bash
OLD=$(pwd)
for directory in $(find $(pwd)/repo -type d | grep -i repodata | xargs dirname); do
	echo "===> $directory";
	cd $directory;
	createrepo .
	echo " ";
	cd $OLD;
done;
