import 'package:clean_with_bloc_practice/data/common/util/serializable.dart';

class DeviceInfoResponse implements Serializable {
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
  DateTime? doyaUpdateDate;
  String? notificationStatus;

  DeviceInfoResponse({
    this.userId,
    this.deviceUuid,
    this.deviceDensity,
    this.deviceWidth,
    this.deviceHeight,
    this.deviceToken,
    this.deviceType,
    this.appVersionName,
    this.appVersionCode,
    this.permissions,
    this.deviceImei,
    this.deviceManufacturer,
    this.deviceBrand,
    this.deviceProduct,
    this.deviceModel,
    this.deviceOsVersion,
    this.deviceSdkVersion,
    this.packageName,
    this.doyaUpdateDate,
    this.notificationStatus,
  });

  factory DeviceInfoResponse.fromJson(Map<String, dynamic> json) =>
      DeviceInfoResponse(
        userId: json["user_id"],
        deviceUuid: json["device_uuid"],
        deviceDensity: json["device_density"],
        deviceWidth: json["device_width"],
        deviceHeight: json["device_height"],
        deviceToken: json["device_token"],
        deviceType: json["device_type"],
        appVersionName: json["app_version_name"],
        appVersionCode: json["app_version_code"],
        permissions: json["permissions"],
        deviceImei: json["device_imei"],
        deviceManufacturer: json["device_manufacturer"],
        deviceBrand: json["device_brand"],
        deviceProduct: json["device_product"],
        deviceModel: json["device_model"],
        deviceOsVersion: json["device_os_version"],
        deviceSdkVersion: json["device_sdk_version"],
        packageName: json["packageName"],
        doyaUpdateDate: json["doya_update_date"],
        notificationStatus: json["notification_status"],
      );

  Map<String, dynamic> toJson() => {
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
        "doya_update_date": doyaUpdateDate!.toIso8601String(),
        "notification_status": notificationStatus.toString(),
      };
}
