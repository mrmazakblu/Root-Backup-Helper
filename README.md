Work in progress.... Slooooowwly

Script to be used in android termux app

Install termux and run these three commands

	pkg update
	pkg upgrade
	pkg install curl

Then curl this script to termux with the following commands

	curl https://raw.githubusercontent.com/mrmazakblu/Root-Backup-Helper/master/dd-backup-maker.sh > maker.sh
	chmod 755 maker.sh

Next part will need root.
This project was a spinn off from XDA's  @diplomatics work with the temp root shell given by MTK-SU
*working on a smooth method to joint these two steps together, for now you need to run MTK-SU , then from the root shell
run this backup-Helper*

Now from the root shell run the maker.sh to make your backup script, which will match your partition scheme, with the command

	./maker.sh

At the end of the maker.sh, you will get 3 options. 
1. run full backup
2. run backup of just boot and recovery
3. exit --without doing any backup

