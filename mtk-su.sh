#!/data/data/com.termux/files/usr/bin/bash

base="https://raw.githubusercontent.com/mrmazakblu/Root-Backup-Helper/master"
clone="https://github.com/mrmazakblu/Root-Backup-Helper.git"

set_var()
{
	curl $base/VERSION.md > VERSION.md
	{ read latest; read xda; read version; } < VERSION.md
	{ read curent; } < mtk-su/VERSION.md
	cdir="$PWD"
	arch="$(uname -m)"
	if [ $arch = aarch64 ]
	then 
		arch="arm64"
	else
 		arch="arm"
    fi
}

instal()
{
	[ -d mtk-su ] && rm -rf mtk-su
	mkdir mtk-su
	mkdir mtk-su/$version
	curl $base/VERSION.md > mtk-su/VERSION.md
	curl -Lkso $version.zip $xda
	unzip -d mtk-su/$version $version.zip
	cd mtk-su
	cd "$version"
	cd "$arch"
	chmod 755 mtk-su
	cd ..
	cd ..
	cd ..
}

run()
{
	curl $base/dd-backup-maker.sh > maker.sh
	chmod 755 maker.sh
	FILES="dd-backup.sh dd-backup-boot-recovery.sh partitions.txt"
	for F in $FILES; do
	rm -f $F
	touch $F
	done
	(./mtk-su/$version/$arch/mtk-su -c ./maker.sh)
}

set_var
if [ "$latest" = "$curent" ]
then
   run
else
   instal
   run
fi