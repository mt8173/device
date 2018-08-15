include device/wisky/$(MTK_TARGET_PROJECT)/ProjectConfig.mk

# Example: Re-use system.prop from base project
TARGET_SYSTEM_PROP := device/wisky/$(MTK_BASE_PROJECT)/system.prop

######################################################
# Please add flavor project's rules under this line. #
######################################################
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# PRODUCT_COPY_FILES overwrite
# Please add flavor project's PRODUCT_COPY_FILES here.
# It will overwrite base project's PRODUCT_COPY_FILES.
PRODUCT_COPY_FILES += device/wisky/$(MTK_BASE_PROJECT)/fstab.mt8173:root/fstab.mt8173
PRODUCT_COPY_FILES += device/wisky/$(MTK_BASE_PROJECT)/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += device/wisky/$(MTK_BASE_PROJECT)/meta_init.project.rc:root/meta_init.project.rc
PRODUCT_COPY_FILES += device/wisky/$(MTK_BASE_PROJECT)/factory_init.project.rc:root/factory_init.project.rc

# Audio Related Resource in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav:mtk

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_03.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_03.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_04.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_04.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_05.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_05.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_06.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_06.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/wisky8176_tb_n/factory/res/images/lcd_test_07.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_07.png:mtk


USE_CUSTOM_AUDIO_POLICY := 1

PRODUCT_COPY_FILES += device/wisky/wisky8176_tb_n/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf:mtk
PRODUCT_COPY_FILES += device/wisky/wisky8176_tb_n/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/vendor/etc/audio_effects.conf:mtk
PRODUCT_COPY_FILES += device/wisky/wisky8176_tb_n/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml:mtk
# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += device/wisky/$(MTK_BASE_PROJECT)/overlay
# sensor related xml files for CTS
ifneq ($(strip $(CUSTOM_KERNEL_ACCELEROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_MAGNETOMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_ALSPS)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
else
  ifneq ($(strip $(CUSTOM_KERNEL_PS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  endif
  ifneq ($(strip $(CUSTOM_KERNEL_ALS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
  endif
endif

ifneq ($(strip $(CUSTOM_KERNEL_GYROSCOPE)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

PRODUCT_COPY_FILES += device/wisky/wisky8176_tb_n/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml


DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/wifi

#######################################################
# Please add flavor project's rules before this line. #
#######################################################

$(call inherit-product, device/mediatek/mt8173/device.mk)

$(call inherit-product-if-exists, vendor/wisky/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)


$(call inherit-product-if-exists, $(CUSTOMIZATION_PATH)/apk/preinstall.mk)
ifneq ($(CUSTOMIZATION_OVERLAY_PATH),)
  $(warning "==============================================$(CUSTOMIZATION_OVERLAY_PATH)")
  DEVICE_PACKAGE_OVERLAYS += $(CUSTOMIZATION_PATH)/overlay
endif

##$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)

PRODUCT_COPY_FILES += $(LOCAL_PATH)/softwin.mp4:system/media/softwin.mp4

PRODUCT_PACKAGES += \
	GBoxDesktop \
	GBoxSettings \
	Gamepad \
