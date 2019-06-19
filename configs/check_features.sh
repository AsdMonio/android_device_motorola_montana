#!/sbin/sh

remove_nfc() {
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
}

if [ $(getprop ro.boot.hardware.sku) == "XT1790" ]  || [ $(getprop ro.boot.hardware.sku) == "XT1792" ] || [ $(getprop ro.boot.hardware.sku) == "XT1795" ]; then
    # XT1790, XT1792 and XT1795 don't have NFC
    remove_nfc
fi

# Remove DTB stuff
rm /system/vendor/etc/permissions/com.motorola.hardware.dtv.xml
rm /system/vendor/etc/permissions/mot_dtv_permissions.xml
rm /system/vendor/lib/libdtvtuner.so
rm /system/vendor/lib64/libdtvtuner.so
rm /system/vendor/lib/libdtvhal.so
rm /system/vendor/lib64/libdtvhal.so
rm -r /system/vendor/app/DTVPlayer
rm -r /system/vendor/app/DTVService

if [ $(getprop ro.boot.hardware.sku) != "XT1790" ] || [ $(getprop ro.boot.hardware.sku) != "XT1792" ] || [ $(getprop ro.boot.hardware.sku) != "XT1795" ]; then
    # XT1790,XT1792 and XT1795 have a compass
    rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
fi
