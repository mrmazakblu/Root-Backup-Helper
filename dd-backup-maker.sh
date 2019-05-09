#!/system/bin/sh

##
# dd-backup helper script
# by bigrammy @ xda-developers

# Termux Needs "paste" WTF! for this to work it's included in "pkg install coreutils"
# This Gem will find your by-name paths and add them 
# to a text file in /sdcard/dd-backup But wait there's more
# it also edits the text file with dd cmds automatically so 
# you can copy 'n' paste them in your teminal
# EG: /dd if=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot of=/sdcard/dd-backup/boot.img 

echo "making dd-backup folder"
folder="/sdcard/dd-backup"
script="dd-backup.sh"
script2="dd-backup-boot-recovery.sh"
mkdir "$folder"
### Make Full Backup Script ###
#echo "#!/data/data/com.termux/files/usr/bin/bash" > $script
echo "#!/system/bin/sh" > "$script"
echo "" >> "$script"
echo "" > partitions.txt
base="$(find /dev -name by-name| head -1)"
ls "$base" | while read x; do echo dd if="$base"/$x of="$folder"/$x >> "$script" && echo $x >> partitions.txt; done
echo "" >> "$script"
### Make Boot Recovery Backup Script ###
echo "#!/system/bin/sh" > "$script2"
echo "" >> "$script2"
echo dd if="$base"/boot of="$folder"/boot >> "$script2"
echo dd if="$base"/recovery of="$folder"/recovery >> "$script2"
echo "" >> "$script2"
### Set Permissions On scripts ###
chmod 0755 "$script"
chmod 0755 "$script2"
echo ""
echo "dd-backup.txt created with no user input required"
echo ""
echo ""
echo "Hit @diplomatic THANKS button for mtk-su!!"
echo ""
echo ""
echo "Hit My THANKS Button Cheers @bigrammy"


echo "----------------------------------------------------------------------------"
PS3='Please enter your choice number: '
options=("Run ALL Backups 1" "Run Boot-Recovery Backup 2" "EXIT 3")
select opt in "${options[@]}"
	do
		case $opt in
			"Run ALL Backups 1")
				./"$script"
				echo "press enter to exit"
					read \n
				exit
			;;
			"Run Boot-Recovery Backup 2")
				./"$script2"
				echo "press enter to exit"
					read \n
				exit
			;;
			"EXIT 3")
				echo "press enter to exit"
					read \n
				exit 
			;;
			*) echo invalid option;;
		esac
	done


exit
