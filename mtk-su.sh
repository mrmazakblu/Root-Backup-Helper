#!/data/data/com.termux/files/usr/bin/bash

base="https://raw.githubusercontent.com/mrmazakblu/Root-Backup-Helper/master"
clone="https://github.com/mrmazakblu/Root-Backup-Helper.git"
set_var()
{
	latest="$(curl $base/VERSION.md 2> /dev/null)"
	current="$(cat mtk-su/VERSION.md 2> /dev/null)"
	cdir="$PWD"
	arch="$(uname -m)"
	if [ $arch = aarch64 ]
	then 
		arch="arm64"
	fi
	if [ $arch = armv7l ]
	then 
		arch="arm"
        fi
}

instal()
{
	[ -d mtk-su ] && rm -rf mtk-su
	git clone "$clone" mtk-su 2> /dev/null
	cd mtk-su
	cd mtk-su_r12
	cd "$arch"
	chmod 755 mtk-su
	cd ..
	cd ..
	cd ..
}

run()
{
	curl https://del.dog/raw/bafepekecu > maker.sh
	chmod 755 maker.sh
	(./mtk-su/mtk-su_r12/$arch/mtk-su -v)
	./maker.sh
}

set_var
# test override
#arch=arm
if cmp -s "$latest" "$curent"
then
   run
else
   instal
   run
fi