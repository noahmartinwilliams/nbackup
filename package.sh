#! /bin/bash

cd ..
cp -r backup backup.0.1.0-all
cd backup.0.1.0-all
gzip doc/*
mkdir usr
mkdir usr/share
mkdir usr/share/man
mkdir usr/share/man/man{1..9}
find doc -type f -regex '^.*\.[0-9]\.gz$' -exec mv '{}' usr/share/man/ \;

mv usr/share/man/*.1 /usr/share/man/man1
mv usr/share/man/*.2 /usr/share/man/man2
mv usr/share/man/*.3 /usr/share/man/man3
mv usr/share/man/*.4 /usr/share/man/man4
mv usr/share/man/*.5 /usr/share/man/man5
mv usr/share/man/*.6 /usr/share/man/man6
mv usr/share/man/*.7 /usr/share/man/man7
mv usr/share/man/*.8 /usr/share/man/man8
mv usr/share/man/*.9 /usr/share/man/man9

mkdir usr/bin
mv src/backup usr/bin

rmdir doc
rmdir src
rm package.sh
rm -rf .git

cd ..
dpkg -b backup.0.1.0-all
