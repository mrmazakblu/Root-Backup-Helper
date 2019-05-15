#!/data/data/com.termux/files/usr/bin/bash

base="https://raw.githubusercontent.com/mrmazakblu/Root-Backup-Helper/master"
clone="https://github.com/mrmazakblu/Root-Backup-Helper.git"
#xda="https://forum.xda-developers.com/attachment.php?attachmentid=4749479"
#version="mtk-su_r12"
set_var()
{
	latest="$(curl $base/VERSION.md 2> /dev/null)"
	curent="$(cat mtk-su/VERSION.md 2> /dev/null)"
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
	git clone "$clone" mtk-su 2> /dev/null
	chmod 755 mtk-su/version.sh
	bash ./mtk-su/version.sh
	echo $version in original sh
    mkdir mtk-su/$version		
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
	(./mtk-su/mtk-su_r12/$arch/mtk-su -c ./maker.sh)
}

set_var
# test override
#arch=arm
if [ "$latest" = "$curent" ]
then
   run
else
   instal
   run
fi