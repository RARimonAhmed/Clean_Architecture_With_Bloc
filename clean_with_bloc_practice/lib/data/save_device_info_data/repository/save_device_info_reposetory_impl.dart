import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/api/save_device_info_api.dart';
import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/repository/save_device_info_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_exception.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoApi deviceInfoApi;

  DeviceInfoRepositoryImpl({ required this.deviceInfoApi });

  @override
  Future<Either<DeviceInfoEntity, Failure>> saveDeviceInfo(DeviceInfoRequest deviceInfoRequest) async {
    try{
      var result = await deviceInfoApi.saveDeviceInfo(deviceInfoRequest);
      return Left(result);
    } on BaseException catch(e){
      return Right(BaseFailure(message: e.message, code: e.code!));
      // String errorMessage = ErrorMapper.getErrorMessage(e.httpStatusCode);
      // return Right(Failure(message: errorMessage));
    }
  }

}
