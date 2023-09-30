import '../../../data/save_device_info_data/remote/dto/save_device_info_response.dart';

class DeviceInfoEntity {
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
  DeviceInfoEntity({
    required this.userId,
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
    required this.notificationStatus,
  });

  factory DeviceInfoEntity.toEntity(DeviceInfoResponse deviceInfoResponse) {
    return DeviceInfoEntity(
      userId: deviceInfoResponse.userId,
      deviceUuid: deviceInfoResponse.deviceUuid,
      deviceDensity: deviceInfoResponse.deviceDensity,
      deviceWidth: deviceInfoResponse.deviceWidth,
      deviceHeight: deviceInfoResponse.deviceHeight,
      deviceToken: deviceInfoResponse.deviceToken,
      deviceType: deviceInfoResponse.deviceType,
      appVersionName: deviceInfoResponse.appVersionName,
      appVersionCode: deviceInfoResponse.appVersionCode,
      permissions: deviceInfoResponse.permissions,
      deviceImei: deviceInfoResponse.deviceImei,
      deviceManufacturer: deviceInfoResponse.deviceManufacturer,
      deviceBrand: deviceInfoResponse.deviceBrand,
      deviceProduct: deviceInfoResponse.deviceProduct,
      deviceModel: deviceInfoResponse.deviceModel,
      deviceOsVersion: deviceInfoResponse.deviceOsVersion,
      deviceSdkVersion: deviceInfoResponse.deviceSdkVersion,
      packageName: deviceInfoResponse.packageName,
      doyaUpdateDate: deviceInfoResponse.doyaUpdateDate.toString(),
      notificationStatus: deviceInfoResponse.notificationStatus,
    );
  }

  Map toJson() => {
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
        "notification_status": notificationStatus.toString(),
      };
}
