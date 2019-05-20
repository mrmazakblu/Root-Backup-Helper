Work in progress.... Slooooowwly

TO Run MTK-SU and then the backup helper

Script to be used in android termux app

This process uses "curl" and "git" to sync with files on internet, so an active internet connection is needed.

Install termux and run these four commands
to make sure you have needed termux resources

	pkg update
	pkg upgrade
	pkg install curl
	pkg install git

Then use curl to copy the "mtk-su.sh" script to termux with the following commands
The script is same at github location. Just easier to use "del.dog" to shorten the url.


	curl https://del.dog/raw/mtk-su.sh > mtk-su.sh
	chmod 755 mtk-su.sh
	./mtk-su.sh
	
This will download latest version of mtk-su, then check which version (32-bit or 64-bit)
that is needed to run on your device.
Then it will run the backup-maker script, and give the option to backup boot and recovery or all partitions.

There is no gaurantee that this mtk-su will work on your particular device. If you fail to complete the first method , using mtk-su and backup-helper together then after getting root (some other way) you can still run back-up helper by itself

To run just the Backup-help curl from this address	
	
	curl https://raw.githubusercontent.com/mrmazakblu/Root-Backup-Helper/master/dd-backup-maker.sh > maker.sh
	chmod 755 maker.sh

Next part will need root to work. The method above includes a root step.

	./maker.sh

At the end of the maker.sh, you will get 3 options. 
1. run full backup
2. run backup of just boot and recovery
3. exit --without doing any backup

