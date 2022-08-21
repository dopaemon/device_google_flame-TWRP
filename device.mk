#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# API
BOARD_SHIPPING_API_LEVEL := 31
BOARD_API_LEVEL := 31
PRODUCT_SHIPPING_API_LEVEL := 31
SHIPPING_API_LEVEL := 31

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc \
    update_engine \
    update_engine_client \
    update_verifier \
    update_engine_sideload

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# F2FS utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.1-impl-mock

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0

# TWRP
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/vintf/manifest.xml \
    $(DEVICE_PATH)/recovery/root/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc \
    $(DEVICE_PATH)/recovery/root/system/etc/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/compatibility_matrix.3.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.3.xml \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/compatibility_matrix.4.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.4.xml \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/compatibility_matrix.5.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.5.xml \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/compatibility_matrix.6.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.6.xml \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/compatibility_matrix.device.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/compatibility_matrix.device.xml \
    $(DEVICE_PATH)/recovery/root/system/etc/vintf/manifest.xml:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/vintf/manifest.xml

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
