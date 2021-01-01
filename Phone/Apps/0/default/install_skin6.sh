#!/bin/sh
export SKINNAME=skin6
export TOPIC=Skinfiles
export MIBPATH=/eso/hmi/lsd/Resources/$SKINNAME/images.mcf
export SDPATH=/$TOPIC/$SKINNAME/images.mcf
export DESCRIPTION="This script will install $SKINNAME"
export TYPE="file"


echo $DESCRIPTION


. /eso/bin/PhoneCustomer/default/util_info.sh

. /eso/bin/PhoneCustomer/default/util_mountsd.sh
if [[ -z "$VOLUME" ]] 
then
	echo "No SD-card found, quitting"
	exit 0
fi

#Make backup folder
export BACKUPFOLDER=$VOLUME/Backup/$VERSION/$FAZIT/$TOPIC/$SKINNAME

#include script to make backup
. /eso/bin/PhoneCustomer/default/util_backup.sh


# include script tocopy file(s)
# remount everything as read-only again
. /eso/bin/PhoneCustomer/default/util_copy.sh


echo "Done. Now restart the unit."
exit 0
