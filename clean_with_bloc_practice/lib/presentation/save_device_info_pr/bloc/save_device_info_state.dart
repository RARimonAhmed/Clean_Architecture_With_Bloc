// import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';
// import 'package:equatable/equatable.dart';
//
// abstract class DeviceInfoState extends Equatable {}
//
// class DeviceInfoInit implements DeviceInfoState{
//   @override
//   List<Object?> get props => [];
//
//   @override
//   bool? get stringify => false;
// }
//
// class DeviceInfoLoadingState implements DeviceInfoState {
//   final bool isLoading;
//
//   DeviceInfoLoadingState({required this.isLoading});
//
//   @override
//   List<Object?> get props => [];
//
//   @override
//   bool? get stringify => false;
// }
//
// class DeviceInfoSuccessResult implements DeviceInfoState {
//   final DeviceInfoEntity deviceInfoEntity;
//
//   DeviceInfoSuccessResult({required this.deviceInfoEntity});
//
//   @override
//   List<Object?> get props => [deviceInfoEntity];
//
//   @override
//   bool? get stringify => false;
// }
//
// class DeviceInfoStateErrorResult implements DeviceInfoState {
//   final String message;
//
//   DeviceInfoStateErrorResult({required this.message});
//
//   @override
//   List<Object?> get props => [message];
//
//   @override
//   bool? get stringify => false;
// }
//
//

import 'package:equatable/equatable.dart';
import '../../../domain/save_device_info_domain/entity/save_device_info_entity.dart';

abstract class DeviceInfoState extends Equatable{}


class DeviceInfoInit implements DeviceInfoState {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

}

class DeviceInfoLoadingState implements DeviceInfoState {
  final bool isLoading;

  DeviceInfoLoadingState({ required this.isLoading });

  @override
  List<Object?> get props => [isLoading];

  @override
  bool? get stringify => false;

}

class DeviceInfoSuccessResult implements DeviceInfoState {
  final DeviceInfoEntity deviceInfoEntity;

  DeviceInfoSuccessResult({ required this.deviceInfoEntity });

  @override
  List<Object?> get props => [deviceInfoEntity];

  @override
  bool? get stringify => false;

}

class DeviceInfoStateErrorResult implements DeviceInfoState{
  final String message;

  DeviceInfoStateErrorResult({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;

}
