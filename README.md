Compile Hacks
-------------
* Add #undef FEATURE_IPV6 just above #ifdef FEATURE_IPV6 in B2G/device/htc/m7-common/gps/libloc_api_50001/loc_eng_log.h
* Copy (generated) kernel includes to B2G/out/target/product/m7ul/obj/KERNEL_OBJ/usr/include/linux
* deactivate alsa in BoardConfig.mk

Running Hacks
-------------
* adb push modules to /system/lib/modules (extracted from CyanogenMod 10.2 nightly build, /modules/ directory in this repository)
* adb push B2G/out/target/product/m7ul/data/local to /data/local
* Change default.prop persist.sys.usb.config line to: persist.sys.usb.config=mtp,adb
* Add user_pref("layout.css.devPixelsPerPx", "2.0"); to /data/b2g/mozilla/<profile_id>.default/prefs.js

TODO:
-----
* compile kernel and copy kernel includes to B2G/out/target/product/m7ul/obj/KERNEL_OBJ/usr/include/linux
* Add all the changes to the build process
* create update.zip for easy flash with Recovery
