class DeviceInfoRequest {
  String? userId;
  String? deviceUuid;
  String? deviceDensity;
  String? deviceWidth;
  String? deviceHeight;
  String? deviceToken;
  String? deviceType;
  String? appVersionName;
  String? appVersionCode;
  dynamic permissions;
  dynamic deviceImei;
  String? deviceManufacturer;
  String? deviceBrand;
  String? deviceProduct;
  String? deviceModel;
  String? deviceOsVersion;
  String? deviceSdkVersion;
  String? packageName;
  String? doyaUpdateDate;
  String? notificationStatus;

  DeviceInfoRequest(
      {required this.userId,
      required this.deviceUuid,
      required this.deviceDensity,
      required this.deviceWidth,
      required this.deviceHeight,
      required this.deviceToken,
      required this.deviceType,
      required this.appVersionName,
      required this.appVersionCode,
      required this.permissions,
      required this.deviceImei,
      required this.deviceManufacturer,
      required this.deviceBrand,
      required this.deviceProduct,
      required this.deviceModel,
      required this.deviceOsVersion,
      required this.deviceSdkVersion,
      required this.packageName,
      required this.doyaUpdateDate,
      required this.notificationStatus});

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "device_uuid": deviceUuid,
      "device_density": deviceDensity,
      "device_width": deviceWidth,
      "device_height": deviceHeight,
      "device_token": deviceToken,
      "device_type": deviceType,
      "app_version_name": appVersionName,
      "app_version_code": appVersionCode,
      "permissions": permissions,
      "device_imei": deviceImei,
      "device_manufacturer": deviceManufacturer,
      "device_brand": deviceBrand,
      "device_product": deviceProduct,
      "device_model": deviceModel,
      "device_os_version": deviceOsVersion,
      "device_sdk_version": deviceSdkVersion,
      "package_name": packageName,
      "doya_update_date": doyaUpdateDate!.toString(),
      "notification_status": notificationStatus.toString()
    };
  }
}
