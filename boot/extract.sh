./clean.sh
unmkbootimg $1
mkdir initramfs_dir
cd initramfs_dir
gunzip -c ../initramfs.cpio.gz | cpio -i
