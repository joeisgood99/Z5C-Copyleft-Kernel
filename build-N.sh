### Uber-GCC 4.9.x

TCPATH="/home/ben/ubertc/out/aarch64-linux-android-4.9/bin/aarch64-linux-android-"
FINALFILES="/home/ben/development/Kernel/kernel-Source-Code/final_files"
version="01"
BUILD_START=$(date +"%s")

make clean && make mrproper

export KBUILD_DIFFCONFIG=suzuran_diffconfig 
make msm8994-KaliV2-perf_defconfig ARCH=arm64 CROSS_COMPILE=$TCPATH

make ARCH=arm64 CROSS_COMPILE=$TCPATH

echo "checking for compiled kernel..."
if [ -f arch/arm64/boot/Image.gz-dtb ]
then

#echo "generating device tree..."
##make dtbs
#../final_files/dtbToolCM --force-v2 -o ../final_files/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/dts/

### copy zImage
#echo "Moving zImage,dt.img and modules.ko to $FINALFILES ..."

#cp arch/arm64/boot/Image $FINALFILES/.
#find . -name '*ko' -exec cp '{}' $FINALFILES/modules \;

#echo "DONE"

#fi
### E5823
#echo "Building boot_E5823.img from ramdisk, zImage & dt.img ..."

#../final_files/mkbootimg --cmdline "androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-5 dwc3_msm.prop_chg_detect=Y coherent_pool=2M dwc3_msm.hvdcp_max_current=1500 enforcing=0" --base 0x00000000 --kernel arch/arm64/boot/Image.gz-dtb --ramdisk ../final_files/5-11Ramdisk-E5823.cpio.gz --ramdisk_offset 0x02000000 --pagesize 4096 -o ../final_files/boot_E5823.img --tags_offset 0x01E00000

#if [ -e ../final_files/boot_E5823.img ]
#then

### Zip boot.img
#echo "Creating TWRP installable .zip cont boot.img and modules..."
#cd ../final_files/
#mv $FINALFILES/boot_E5823.img $FINALFILES/New-kali-5-11-boot.img
#zip -r  New-kali-5-11-boot.img META-INF modules 
#rm -f boot.img

### Version number
#echo -n "Enter version number: "
#read version

#mv /home/ben/kernel-Source-Code/final_files/Z5C_kali-305-boot_v.zip  /home/ben/kernel-Source-Code/#final_files/Kali-Z5C_Joeisgood99_v$version.zip

BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo "CopyLeft-07-zip completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
else
echo "Compilation failed! Fix the errors!"

fi

