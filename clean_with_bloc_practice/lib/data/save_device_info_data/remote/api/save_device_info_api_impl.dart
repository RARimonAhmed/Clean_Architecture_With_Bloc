import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/api/save_device_info_api.dart';
import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_response.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';
import 'package:dio/dio.dart';
import 'package:clean_with_bloc_practice/data/common/response/response_wrapper.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_exception.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeviceInfoApiImpl implements DeviceInfoApi {
  final Dio dio;

  DeviceInfoApiImpl({required this.dio});

  @override
  Future<DeviceInfoEntity> saveDeviceInfo(
      DeviceInfoRequest deviceInfoRequest) async {
    try {
      final response =
          await dio.post("/saveDeviceInfo", data: deviceInfoRequest.toJson());
      var converted = WrappedResponse<DeviceInfoResponse>.fromJson(
          response.data, (data) => DeviceInfoResponse.fromJson(data));
      print("DeviceInfo status code : ${response.statusCode}");
      print("DeviceInfo details : ${response.data}");
      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        print("Device information successfully done");
        Fluttertoast.showToast(
            msg: "Device information successfully done",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return DeviceInfoEntity(
            userId: converted.data!.userId,
            deviceUuid: converted.data!.deviceUuid,
            deviceDensity: converted.data!.deviceDensity,
            deviceWidth: converted.data!.deviceWidth,
            deviceHeight: converted.data!.deviceHeight,
            deviceToken: converted.data!.deviceToken,
            deviceType: converted.data!.deviceType,
            appVersionName: converted.data!.appVersionName,
            appVersionCode: converted.data!.appVersionCode,
            permissions: converted.data!.permissions,
            deviceImei: converted.data!.deviceImei,
            deviceManufacturer: converted.data!.deviceManufacturer,
            deviceBrand: converted.data!.deviceBrand,
            deviceProduct: converted.data!.deviceProduct,
            deviceModel: converted.data!.deviceModel,
            deviceOsVersion: converted.data!.deviceOsVersion,
            deviceSdkVersion: converted.data!.deviceSdkVersion,
            packageName: converted.data!.packageName,
            doyaUpdateDate: converted.data!.doyaUpdateDate.toString(),
            notificationStatus: converted.data!.notificationStatus);
      }
      throw BaseException(
          message: converted.message_bn.toString(), code: response.statusCode);
    } on DioException catch (e) {
      throw BaseException(
          message: e.message.toString(), code: e.response?.statusCode);
    } on Exception catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
