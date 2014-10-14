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
# cubox-i common mk file.
# based on sabre-sd

COMMON_PATH := device/fsl/cuboxi-common

DEVICE_PACKAGE_OVERLAYS := $(COMMON_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/fsl/imx6-common/common.mk)

# inherit VENDOR blobs and configuration.
$(call inherit-product-if-exists, vendor/fsl/cuboxi-common/cuboxi-common-vendor.mk)

# product characteristics
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := xlarge large tvdpi hdpi

# fstab
TARGET_RECOVERY_FSTAB = device/fsl/cuboxi-common/fstab.freescale
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/fstab.freescale:root/fstab.freescale

# bluetooth
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# brcmfmac module
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/brcmfmac_modules.sh:root/sbin/brcmfmac_modules.sh

# wlan
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# copying prebuilt files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/permissions/required_hardware.xml:system/etc/permissions/required_hardware.xml \
    $(COMMON_PATH)/rootdir/init.freescale.rc:root/init.freescale.rc

# properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.sf.hwrotation=0 \
    persist.sampling_profiler=1 \
    ro.sf.lcd_density=160 \
    debug.hwui.render_dirty_regions=false \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.zygote.disable_gl_preload=true

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
    external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6d.bin:system/lib/firmware/vpu/vpu_fw_imx6d.bin \
    external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6q.bin:system/lib/firmware/vpu/vpu_fw_imx6q.bin

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

PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    FileManager-1.1.6	\
    ethernet
