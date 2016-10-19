#! /usr/bin/env bash
for directory in $(find $(pwd)/repo -type d | grep -i repodata | xargs dirname); do
	echo "===> $directory";
	cd $directory;
	createrepo .
	echo " ";
	cd /vagrant;
done;
