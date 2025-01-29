FDEVICE="X6827"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      PB_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && PB_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$PB_BUILD_DEVICE" ]; then
   pb_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$PN_BUILD_DEVICE" = "$FDEVICE" ]; then
    export TW_DEFAULT_LANGUAGE="en"
    export OF_DEVICE_ALT="X6827,FULL-64"
	export LC_ALL="C"
	export PB_AB_DEVICE=1
	export PB_EXTREME_SIZE_REDUCTION=1
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_QUICK_BACKUP_LIST="/data;"
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export PB_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export PB_USE_BASH_SHELL=1
	export PB_ASH_IS_BASH=1
	export PB_USE_NANO_EDITOR=0
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export OF_CLOCK_POS=1
	export PN_DELETE_AROMAFM=1
	export OF_USE_GREEN_LED=0
	export PB_ENABLE_APP_MANAGER=1
    export PB_USE_XZ_UTILS=1
    export OF_HIDE_NOTCH=1
	
	# Navbar
	export OF_ALLOW_DISABLE_NAVBAR=0
	
	# OTA
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

	# encryption
	export OF_DISABLE_FORCED_ENCRYPTION=1
	export OF_DISABLE_DM_VERITY_FORCED_ENCRYPTION=1
	
	# screen settings
	export OF_SCREEN_H=2460
	export OF_STATUS_H=100
	export OF_CLOCK_POS=2
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48

	# Bootimage Partition path
	export PB_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
	export PB_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export PB_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	
	# flashlight
	export OF_FLASHLIGHT_ENABLE=0
  
	# R11
	export PB_VERSION="11.0"
	export PB_VARIANT=Stable
	export OF_PATCH_AVB20=1
	export OF_MAINTAINER="TegarXLu"
	export OF_USE_TWRP_SAR_DETECT=1

	# run a process after formatting data to work-around MTP issues
	export OF_RUN_POST_FORMAT_PROCESS=1

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "PB" >> $PB_BUILD_LOG_FILE
  	   export | grep "OF_" >> $PB_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $PB_BUILD_LOG_FILE
  	   export | grep "TW_" >> $PB_BUILD_LOG_FILE
 	fi

fi
#
