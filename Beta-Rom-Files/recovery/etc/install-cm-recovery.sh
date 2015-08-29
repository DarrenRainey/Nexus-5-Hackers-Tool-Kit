#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11503616 80c37102611570092dd4820b6dc59d9b080f6d82 9162752 3f0a936bd2665d634409530bb841285c5d5a1ee1
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:11503616:80c37102611570092dd4820b6dc59d9b080f6d82; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:9162752:3f0a936bd2665d634409530bb841285c5d5a1ee1 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 80c37102611570092dd4820b6dc59d9b080f6d82 11503616 3f0a936bd2665d634409530bb841285c5d5a1ee1:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
