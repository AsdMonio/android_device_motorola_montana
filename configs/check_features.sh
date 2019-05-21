#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`

if [ "$sku" = "XT1792" ]; then
    # XT1792 doesn't have NFC
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
fi

if [ "$sku" == "XT1792" ]; then
    # XT1792 doesn't have NFC
    remove_nfc
fi

if [ "$sku" == "XT1795" ]; then
    # XT1795 doesn't have NFC
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
fi

if [ "$sku" == "XT1795" ]; then
    # XT1795 doesn't have NFC
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

if [ "$sku" != "XT1792" ]; then
    # Only XT1792 variant has a compass
    rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
fi
