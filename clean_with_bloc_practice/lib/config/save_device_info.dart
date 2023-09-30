import 'dart:io';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceDetails {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<DeviceInfoEntity> getDeviceInformation(String fcmToken) async {
    String userId = "1",
        deviceUuid = "",
        deviceDensity = "",
        deviceWidth = "",
        deviceHeight = "",
        deviceToken = fcmToken,
        deviceType = "",
        appVersionName = "",
        appVersionCode = "",
        deviceManufacturer = "",
        deviceBrand = "",
        deviceProduct = "",
        deviceModel = "",
        deviceOsVersion = "",
        deviceSdkVersion = "";
    String permissions = "";
    String deviceImei = "";
    DateTime doyaUpdateDate = DateTime.now();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        userId = '1'; // Set your user ID
        deviceUuid = deviceData['id'];
        deviceDensity = deviceData['displayXDpi'].toString() +
            "," +
            deviceData['displayYDpi'].toString();
        deviceWidth = deviceData['displayWidthPixels'].toString();
        deviceHeight = deviceData['displayHeightPixels'].toString();
        deviceToken = "fcmToken";
        deviceType = "Android";
        appVersionName = version.toString();
        appVersionCode = buildNumber.toString();
        permissions = "";
        deviceImei = "";
        deviceManufacturer = deviceData['manufacturer'];
        deviceBrand = deviceData['brand'];
        deviceProduct = deviceData['product'];
        deviceModel = deviceData['model'];
        deviceOsVersion = deviceData['version.baseOS'].toString();
        deviceSdkVersion = deviceData['version.sdkInt'].toString();
        doyaUpdateDate =
            doyaUpdateDate; // todo: need to send all the updated date of json files.
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        userId = "1"; // Set your user ID
        deviceUuid = deviceData['identifierForVendor'];
        deviceDensity = "";
        deviceWidth = "";
        deviceHeight = "";
        deviceToken = ""; // Set your device token from firebase
        deviceType = "iOS";
        appVersionName = version;
        appVersionCode = buildNumber;
        permissions = "";
        deviceImei = deviceData['identifierForVendor'];
        deviceManufacturer = "Apple";
        deviceBrand = deviceData['name'];
        deviceProduct = deviceData['model'];
        deviceModel = deviceData['model'];
        deviceOsVersion = deviceData['systemVersion'];
        deviceSdkVersion = deviceData[
        'systemName']; // No SDK version available in iOS system name added as replacement
        doyaUpdateDate =
            doyaUpdateDate; // need to send all the modified date time of all the json files.
      }
    } catch (e) {
      print("Failed to get device information: $e");
    }

    DeviceInfoEntity deviceInfoEntity = DeviceInfoEntity(
        userId: userId,
        deviceUuid: deviceUuid,
        deviceDensity: deviceDensity,
        deviceWidth: deviceWidth,
        deviceHeight: deviceHeight,
        deviceToken: fcmToken,
        deviceType: deviceType,
        appVersionName: appVersionName,
        appVersionCode: appVersionCode,
        permissions: "permissions",
        deviceImei: "deviceImei",
        deviceManufacturer: deviceManufacturer,
        deviceBrand: deviceBrand,
        deviceProduct: deviceProduct,
        deviceModel: deviceModel,
        deviceOsVersion: deviceOsVersion,
        deviceSdkVersion: deviceSdkVersion,
        packageName: packageName,
        doyaUpdateDate: doyaUpdateDate.toString(), notificationStatus: "on");
    return deviceInfoEntity;

    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DeviceInfoPage(deviceInfoBloc: sl.get(), deviceInfoEntity: deviceInfoEntity)));
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
      ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname': data.utsname.sysname,
      'utsname.nodename': data.utsname.nodename,
      'utsname.release': data.utsname.release,
      'utsname.version': data.utsname.version,
      'utsname.machine': data.utsname.machine,
    };
  }
}

DeviceDetails deviceDetails = DeviceDetails();

Future<DeviceInfoEntity> deviceInfo() async{
  return deviceDetails.getDeviceInformation("It will set");
}
