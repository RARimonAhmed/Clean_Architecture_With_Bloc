import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import '../entity/save_device_info_entity.dart';

abstract class DeviceInfoRepository {
  Future<Either<DeviceInfoEntity, Failure>> saveDeviceInfo(DeviceInfoRequest deviceInfoRequest);
}
