#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`
device=`getprop ro.boot.device`
radio=`getprop ro.boot.radio`

remove_nfc() {
    rm /system/vendor/etc/permissions/android.hardware.nfc.xml
    rm /system/vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /system/vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
}

if [ "$sku" == "XT1687" ] || [ "$device" == "cedric" ]; then
    # XT1687 and cedric don't have NFC chips
    remove_nfc
fi

if [ "$device" == "montana" ]; then
    if [ "$radio" != "EMEA" ] && [ "$radio" != "APAC" ]; then
        # On montana only EMEA and APAC radio models have NFC
        remove_nfc
    fi
fi

if [ "$sku" != "XT1687" ]; then
    # Only XT1687 variant got a compass
    rm /system/vendor/etc/permissions/android.hardware.sensor.compass.xml
fi

if [ "$sku" != "XT1683" ]; then
    # Only XT1683 has DTV support
    rm /system/vendor/etc/permissions/com.motorola.hardware.dtv.xml
    rm /system/vendor/etc/permissions/mot_dtv_permissions.xml
    rm /system/vendor/lib/libdtvtuner.so
    rm /system/vendor/lib64/libdtvtuner.so
    rm /system/vendor/lib/libdtvhal.so
    rm /system/vendor/lib64/libdtvhal.so
    rm -r /system/vendor/app/DTVPlayer
    rm -r /system/vendor/app/DTVService
fi

