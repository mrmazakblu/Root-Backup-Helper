Work in progress.... Slooooowwly

TO Run MTK-SU and then the backup helper

Script to be used in android termux app

Install termux and run these three commands
to make sure you have needed termux resources

	pkg update
	pkg upgrade
	pkg install curl
	pkg install git

Then curl this script to termux with the following commands

	curl ttps://del.dog/raw/mtk-su.sh > mtk-sh.sh
	chmod 755 mtk-su.sh
	./mtk-su.sh
	
This will download V 12 of mtk-su, then check which version (32-bit or 64-bit)
that is needed to run on your device.
Then it will run the backup-maker script, and give the option to backup boot and recovery or all partitions.


To run just the Backup-help curl from this address	
	
	curl https://del.dog/raw/bafepekecu > maker.sh
	chmod 755 maker.sh

Next part will need root to work. The method above includes a root step.

	./maker.sh

At the end of the maker.sh, you will get 3 options. 
1. run full backup
2. run backup of just boot and recovery
3. exit --without doing any backup

