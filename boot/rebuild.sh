mkbootfs initramfs_dir | gzip > ./newinitramfs.cpio.gz
mkbootimg --kernel zImage --ramdisk newinitramfs.cpio.gz --base 0x80600000 --cmdline 'console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31' -o new_boot.img
#cp new_boot.img ../B2G/out/target/product/m7ul/boot.img
