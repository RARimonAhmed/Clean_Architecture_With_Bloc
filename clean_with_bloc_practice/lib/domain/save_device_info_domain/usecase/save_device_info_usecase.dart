import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/repository/save_device_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';

class DeviceInfoUseCase {
  final DeviceInfoRepository deviceInfoRepository;

  DeviceInfoUseCase({required this.deviceInfoRepository});

  Future<Either<DeviceInfoEntity, Failure>> saveDeviceInfo(
      DeviceInfoRequest deviceInfoRequest) async {
    return await deviceInfoRepository.saveDeviceInfo(deviceInfoRequest);
  }
}
