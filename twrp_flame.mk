#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit some common Twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from flame device
$(call inherit-product, device/google/flame/device.mk)

PRODUCT_DEVICE := flame
PRODUCT_NAME := twrp_flame
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 4
PRODUCT_MANUFACTURER := google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="flame-user 12 SQ3A.220705.003.A1 8672226 release-keys"

BUILD_FINGERPRINT := google/flame/flame:12/SQ3A.220705.003.A1/8672226:user/release-keys
