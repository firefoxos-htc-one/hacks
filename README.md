Howto Compile
-------------
Add AndroidProducts.mk to device/htc/m7ul

All commands executed in B2G checkout directory

First, execute:
./config.sh m7ul

Make these hacks:
* comment out configure_device && in build.sh

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
* copy kernel from cyanogenmod to out/target/product/m7ul/kernel

* add "device/htc/m7-common/include" to all LOCAL_C_INCLUDES in device/htc/m7-common/gps/libloc_api_50001/Android.mk

* add fonts to bootable/recovery/fonts from
   cd bootable/recovery/fonts
   wget https://raw.github.com/Mahdi-Rom/android_bootable_recovery/jb-4.3/fonts/12x22.png
   wget https://raw.github.com/Mahdi-Rom/android_bootable_recovery/jb-4.3/fonts/18x32.png

* add the following lines to gaia/build/preferences.js (line 162, before function writePrefs() )
  prefs.push(['layout.css.devPixelsPerPx', '2.5']);
  prefs.push(['ril.data.enabled', true]);

* external/libpng/Android.mk LOCAL_CLANG = false

Now:
export GAIA_DEV_PIXELS_PER_PX=1.5
export GAIA_OPTIMIZE=1
export B2G_SYSTEM_APPS=1
./build.sh

Running Hacks
-------------
* adb push modules to /system/lib/modules (extracted from CyanogenMod 10.2 nightly build, /modules/ directory in this repository)
* Change default.prop persist.sys.usb.config line to: persist.sys.usb.config=mtp,adb

TODO:
-----
* Add all the changes to the build process
* create update.zip for easy flash with Recovery



