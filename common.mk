#
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# CuBox-i common mk file.
# Based on sabre-sd

COMMON_PATH := device/fsl/cuboxi-common

DEVICE_PACKAGE_OVERLAYS := $(COMMON_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/fsl/imx6/imx6.mk)

# fstab
TARGET_RECOVERY_FSTAB = device/fsl/cuboxi/fstab.freescale
PRODUCT_COPY_FILES +=    \
    $(COMMON_PATH)/fstab.freescale:root/fstab.freescale

# copying prebuilt files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/system/etc/permissions/required_hardware.xml:system/etc/permissions/required_hardware.xml \
    $(COMMON_PATH)/rootdir/init.rc:root/init.freescale.rc

PRODUCT_COPY_FILES +=    \
    external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6d.bin:system/lib/firmware/vpu/vpu_fw_imx6d.bin \
    external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6q.bin:system/lib/firmware/vpu/vpu_fw_imx6q.bin

# product characteristics
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml

# 4329 and 4330 firmware files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/firmware/brcm/bcm4329_fw.bin:system/etc/firmware/brcm/brcmfmac4329-sdio.bin \
    $(COMMON_PATH)/firmware/brcm/bcm4329_nvram.txt:system/etc/firmware/brcm/brcmfmac4329-sdio.txt \
    $(COMMON_PATH)/firmware/brcm/bcm4329.hcd:system/etc/firmware/brcm/BCM4329B1.hcd \
    $(COMMON_PATH)/firmware/brcm/bcm4330_fw.bin:system/etc/firmware/brcm/brcmfmac4330-sdio.bin \
    $(COMMON_PATH)/firmware/brcm/bcm4330_nvram.txt:system/etc/firmware/brcm/brcmfmac4330-sdio.txt \
    $(COMMON_PATH)/firmware/brcm/bcm4330.hcd:system/etc/firmware/brcm/BCM4330.hcd \
    $(COMMON_PATH)/rootdir/system/bin/wifi/rc.wifi:system/bin/wifi/rc.wifi

PRODUCT_PACKAGES += \
    bt_vendor.conf \
    brcm_patchram_plus \
    FileManager-1.1.6 \
    ethernet
