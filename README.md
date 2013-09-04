Howto Compile
-------------
Add AndroidProducts.mk to device/htc/m7ul

All commands executed in B2G checkout directory

First, execute:
./config.sh m7ul

Make these hacks:
* hardware/qcom/audio-caf/alsa_sound/Android.mk 
    #ifeq ($(call is-board-platform,msm8960),true)
    LOCAL_MODULE := audio_policy.msm8960
    #endif

    #ifeq ($(call is-board-platform,msm8960),true)
    LOCAL_MODULE := audio.primary.msm8960
    #endif

* hack kernel headers:
    mkdir -p out/target/product/m7ul/obj/KERNEL_OBJ/usr
    cp kernel/htc/m7/include/linux/msm_* external/kernel-headers/original/linux/
    cp hardware/qcom/msm8960/original-kernel-headers/linux/msm_ion.h external/kernel-headers/original/linux/
    cd bionic/libc/kernel/tools
    ./update_all.py
    cd ../../../../
    cp kernel/htc/m7/include/video/msm_hdmi_modes.h bionic/libc/kernel/common/video/
    cp kernel/htc/m7/include/sound/compress_offload.h bionic/libc/kernel/common/sound/
* add "device/htc/m7-common/include" to all LOCAL_C_INCLUDES in device/htc/m7-common/gps/libloc_api_50001/Android.mk

* add fonts to /bootable/recovery/fonts from
https://raw.github.com/Mahdi-Rom/android_bootable_recovery/jb-4.3/fonts/12x22.png
https://raw.github.com/Mahdi-Rom/android_bootable_recovery/jb-4.3/fonts/18x32.png


Now:
./build.sh

Running Hacks
-------------
* adb push modules to /system/lib/modules (extracted from CyanogenMod 10.2 nightly build, /modules/ directory in this repository)
* adb push B2G/out/target/product/m7ul/data/local to /data/local
* Change default.prop persist.sys.usb.config line to: persist.sys.usb.config=mtp,adb
* Add user_pref("layout.css.devPixelsPerPx", "2.5"); to /data/b2g/mozilla/<profile_id>.default/prefs.js

TODO:
-----
* Add all the changes to the build process
* create update.zip for easy flash with Recovery
