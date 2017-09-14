# Copyright 2017 CarbonROM
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

# dont build AOSP camera HAL
# BOARD_USE_ENFORCING_SELINUX := true

WITH_DEXPREOPT := false

# Healthd
HEALTHD_FORCE_BACKLIGHT_CONTROL := true
HEALTHD_ENABLE_TRICOLOR_LED := true
RED_LED_PATH := /sys/class/leds/led:rgb_red/brightness
GREEN_LED_PATH := /sys/class/leds/led:rgb_green/brightness
BLUE_LED_PATH := /sys/class/leds/led:rgb_blue/brightness

USE_DEVICE_SPECIFIC_CAMERA := true
DEVICE_SPECIFIC_CAMERA_PATH := hardware/sony/camera
USE_DEVICE_SPECIFIC_DATASERVICES := true
DEVICE_SPECIFIC_DATASERVICES_PATH := vendor/qcom/opensource/dataservices

ifeq ($(TARGET_KERNEL_VERSION),3.10)
display-hal := hardware/qcom/display/msm8994
media-hal := hardware/qcom/media/msm8974
endif

ifeq ($(TARGET_KERNEL_VERSION),3.18)
display-hal := hardware/qcom/display/msm8996
media-hal := hardware/qcom/media/msm8996
endif

ifeq ($(TARGET_KERNEL_VERSION),4.4)
display-hal := hardware/qcom/display/msm8998
media-hal := hardware/qcom/media/msm8998
endif

ifeq ($(BOARD_HAVE_BLUETOOTH_QCOM),true)
  USE_DEVICE_SPECIFIC_BT := true
  DEVICE_SPECIFIC_BT_PATH := hardware/qcom/bt/msm8998
endif

USE_DEVICE_SPECIFIC_GPS := true
DEVICE_SPECIFIC_GPS_PATH := hardware/qcom/gps/msm8994
USE_DEVICE_SPECIFIC_DISPLAY := true
DEVICE_SPECIFIC_DISPLAY_PATH := $(display-hal)
USE_DEVICE_SPECIFIC_MEDIA := true
DEVICE_SPECIFIC_MEDIA_PATH := $(media-hal)
