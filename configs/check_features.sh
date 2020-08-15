#!/sbin/sh

sku=$(getprop ro.boot.hardware.sku)

if [ "$sku" == "XT1790" ]  || [ "$sku" == "XT1792" ] || [ "$sku" == "XT1795" ]; then
    # XT1790, XT1792 and XT1795 don't have NFC
    rm /vendor/etc/permissions/android.hardware.nfc.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hcef.xml
    rm /vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system_root/system/app/NfcNci
fi

# Remove DTB stuff
rm /vendor/etc/permissions/com.motorola.hardware.dtv.xml
rm /vendor/etc/permissions/mot_dtv_permissions.xml
rm /vendor/lib/libdtvtuner.so
rm /vendor/lib64/libdtvtuner.so
rm /vendor/lib/libdtvhal.so
rm /vendor/lib64/libdtvhal.so
rm -r /vendor/app/DTVPlayer
rm -r /vendor/app/DTVService

if [ "$sku" != "XT1790" ]; then
    # only XT1790 has a compass
    rm /vendor/etc/permissions/android.hardware.sensor.compass.xml
fi
