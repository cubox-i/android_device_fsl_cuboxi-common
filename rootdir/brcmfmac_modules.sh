#!/system/bin/sh
#
# Copyright (C) 2014 The Android Open Source Project
#
# Author: Humberto Borba <humberos@gmail.com>
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
PATH=/system/bin/:/system/xbin/

WIFI_PATH=/data/misc/wifi-log

# logging
#
set_log() {
    rm -rf $1
    exec >> $1 2>&1
}

mkdir -p ${WIFI_PATH}
set_log ${WIFI_PATH}/init.log

# loading dependency
#
busybox echo "loading brcmutil.ko"
insmod /system/lib/modules/brcmutil.ko

sync

# loading brcmfmac module
#
busybox echo "loading brcmfmac.ko"
insmod /system/lib/modules/brcmfmac.ko

busybox echo `dmesg | grep brcmfmac`

lsmod

exit 0

