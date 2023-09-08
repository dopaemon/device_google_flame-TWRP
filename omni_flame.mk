#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from flame device
$(call inherit-product, device/google/flame/device.mk)

PRODUCT_DEVICE := flame
PRODUCT_NAME := omni_flame
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 4
PRODUCT_MANUFACTURER := google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="flame-user 12 S3B1.220318.003 8372304 release-keys"

BUILD_FINGERPRINT := google/flame/flame:12/S3B1.220318.003/8372304:user/release-keys
