#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Inherit from sm6150-common
include device/xiaomi/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/davinci

# Assert
TARGET_OTA_ASSERT_DEVICE := davinci,davinciin

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true

BOARD_USES_ALSA_AUDIO := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest.xml
ODM_MANIFEST_SKUS += davinci
ODM_MANIFEST_DAVINCI_FILES := \
    $(DEVICE_PATH)/configs/hidl/manifest-nfc.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_davinci
TARGET_RECOVERY_DEVICE_MODULES := libinit_davinci

# Kernel
TARGET_KERNEL_CONFIG := davinci_defconfig

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_METADATA_PARTITION := true

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55371083776
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_EROFS_COMPRESSOR := lz4

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Compression
PRODUCT_FS_COMPRESSION := 1

# Screen density
TARGET_SCREEN_DENSITY := 440

# Sepolicy
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Udfps
TARGET_SURFACEFLINGER_UDFPS_LIB := //hardware/xiaomi:libudfps_extension.xiaomi
TARGET_USES_FOD_ZPOS := true

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-10-01

# Inherit from proprietary files
include vendor/xiaomi/davinci/BoardConfigVendor.mk
