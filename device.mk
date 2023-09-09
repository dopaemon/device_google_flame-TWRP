#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enable virtual A/B OTA
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Device Tree PATH
LOCAL_PATH := device/google/flame

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.msmnile

# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#     bootctrl.msmnile \
#     libgptutils \
#     libz \
#     libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    # libandroidicu \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdisplayconfig.qti

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so

# PRODUCT_COPY_FILES += \
#     $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

# TWRP
PRODUCT_COPY_FILES += \
    device/google/flame/prebuilts/vendor/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest.xml \
    device/google/flame/recovery/root/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc \
    device/google/flame/prebuilts/system/etc/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags \
    device/google/flame/prebuilts/system/etc/vintf/compatibility_matrix.3.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.3.xml \
    device/google/flame/prebuilts/system/etc/vintf/compatibility_matrix.4.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.4.xml \
    device/google/flame/prebuilts/system/etc/vintf/compatibility_matrix.5.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.5.xml \
    device/google/flame/prebuilts/system/etc/vintf/compatibility_matrix.6.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.6.xml \
    device/google/flame/prebuilts/system/etc/vintf/compatibility_matrix.device.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.device.xml \
    device/google/flame/prebuilts/system/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/manifest.xml

# Qcom Decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe \
    qseecomd.recovery \
    android.hardware.gatekeeper@1.0-service-qti.recovery \
    android.hardware.keymaster@4.1-service.citadel.recovery \
    android.hardware.keymaster@4.0-service-qti.recovery \
    android.hardware.weaver@1.0-service.citadel.recovery \
    citadeld.recovery \
    android.hardware.authsecret@1.0-impl.nos.recovery \
    android.hardware.keymaster@4.1-impl.nos.recovery \
    android.hardware.oemlock@1.0-impl.nos.recovery \
    android.hardware.weaver@1.0-impl.nos.recovery \
    libdiag.recovery \
    libdrmfs.recovery \
    libkeymasterdeviceutils.recovery \
    libnos_citadeld_proxy.recovery \
    libprotobuf-cpp-full-3.9.1.recovery \
    libprotobuf-cpp-lite-3.9.1.recovery \
    libqcbor.recovery \
    libQSEEComAPI.recovery \
    libqtikeymaster4.recovery \
    librpmb.recovery \
    libspcom.recovery \
    libssd.recovery \
    nos_app_avb.recovery \
    pixelatoms-cpp.recovery \
    libion.recovery \
    libkeymasterutils.recovery

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/qcom/bootctrl \
    device/google/flame/bootctrl \
    device/google/flame/gpt-utils
