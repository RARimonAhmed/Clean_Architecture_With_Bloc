import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:equatable/equatable.dart';

abstract class DeviceInfoEvent extends Equatable{
  void printDeviceInfo();
}

class DeviceInfoEventDo implements DeviceInfoEvent {
  final DeviceInfoRequest deviceInfoRequest;

  DeviceInfoEventDo({required this.deviceInfoRequest});

  @override
  void printDeviceInfo() {
    print("User id = ${deviceInfoRequest.userId}");
  }

  @override
  List<Object?> get props => [deviceInfoRequest];

  @override
  bool? get stringify => false;

}