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
#
# Product-common compile-time definitions.
#

include device/fsl/imx6-common/BoardConfigCommon.mk

# SoC-specific compile-time definitions.
BOARD_SOC_TYPE := IMX6DQ
TARGET_CPU_SMP := true
BOARD_HAVE_VPU := true
HAVE_FSL_IMX_GPU2D := true
HAVE_FSL_IMX_GPU3D := true
HAVE_FSL_IMX_IPU := true
BOARD_KERNEL_BASE := 0x10800000

# build for ext4
BUILD_TARGET_FS := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_UBIFS := false

# wlan
BOARD_WLAN_DEVICE                 := bcmdhd
WPA_SUPPLICANT_VERSION            := VER_0_8_X
WIFI_DRIVER_MODULE_PATH           := "/system/lib/modules/brcmfmac.ko"
WIFI_DRIVER_MODULE_NAME           := "brcmfmac"
WIFI_DRIVER_MODULE_ARG            := ""
BOARD_WPA_SUPPLICANT_DRIVER       := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB  := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER              := NL80211
BOARD_HOSTAPD_PRIVATE_LIB         := lib_driver_cmd_bcmdhd

# gps
# BOARD_HAVE_HARDWARE_GPS := false
USE_QEMU_GPS_HARDWARE := true

# for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true

# modem
BOARD_MODEM_VENDOR := AMAZON

# for recovery service
TARGET_SELECT_KEY := 28

# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# partition setup
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 716800000

# bluetoth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# gralloc
USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true
USE_OPENGL_RENDERER := true
TARGET_HAVE_IMX_GRALLOC := true
TARGET_HAVE_IMX_HWCOMPOSER := true

# camera hal v2
IMX_CAMERA_HAL_V2 := true
BOARD_HAVE_USB_CAMERA := true

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# consumer IR HAL support
# IMX6_CONSUMER_IR_HAL := true

# bootloader setup
BOARD_USES_IMX_UBOOTLOADER := true
TARGET_BOOTLOADER_SOURCE := bootable/bootloader/uboot-imx
TARGET_BOOTLOADER_CONFIG := mx6_cubox-i_config
TARGET_BOOTLOADER_BOARD_NAME := CUBOX-I

# kernel setup
BOARD_USES_UBOOT := true
BOARD_KERNEL_IMAGE_NAME := uImage
TARGET_KERNEL_SOURCE := kernel/fsl/imx
TARGET_KERNEL_CONFIG := imx6_cubox-i_hummingboard_android_defconfig
BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init video=mxcfb0:dev=hdmi,1280x720M@60,if=RGB24 video=mxcfb1:off video=mxcfb2:off fbmem=10M vmalloc=400M androidboot.console=ttymxc0 androidboot.hardware=freescale

# For Linux kernel 3.10.x uncomment the following
# TARGET_KERNEL_DEFCONF := imx_v7_cubox-i_hummingboard_android_defconfig
# TARGET_KERNEL_DTB := imx6q-cubox-i.dtb imx6dl-cubox-i.dtb imx6dl-hummingboard.dtb

# sepolicy
BOARD_SEPOLICY_DIRS := \
    device/fsl/cuboxi-common/sepolicy

BOARD_SEPOLICY_UNION := \
    app.te \
    file_contexts \
    fs_use \
    untrusted_app.te \
    genfs_contexts

# include external codecs sources
include external/fsl_vpu_omx/codec_env.mk
