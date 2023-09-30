import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';

abstract class DeviceInfoApi {
  Future<DeviceInfoEntity> saveDeviceInfo(DeviceInfoRequest deviceInfoRequest);
}
