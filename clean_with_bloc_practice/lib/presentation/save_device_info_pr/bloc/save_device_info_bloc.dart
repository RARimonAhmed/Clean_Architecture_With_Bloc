import 'dart:convert';
import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/usecase/save_device_info_usecase.dart';
import 'package:clean_with_bloc_practice/presentation/save_device_info_pr/bloc/save_device_info_event.dart';
import 'package:clean_with_bloc_practice/presentation/save_device_info_pr/bloc/save_device_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_with_bloc_practice/data/common/module/shared_pref_module.dart';

class DeviceInfoBloc extends Bloc<DeviceInfoEvent, DeviceInfoState> {
  final DeviceInfoUseCase deviceInfoUseCase;
  final SharedPreferenceModule sharedPreferenceModule;

  DeviceInfoBloc({required this.deviceInfoUseCase, required this.sharedPreferenceModule}) : super(DeviceInfoInit());

  Stream<DeviceInfoState> _setIsLoading(bool isLoading) async* {
    yield DeviceInfoLoadingState(isLoading: isLoading);
  }

  @override
  Stream<DeviceInfoState> mapEventToState(DeviceInfoEvent event) async* {
    if(event is DeviceInfoEventDo){
      yield* saveDeviceInfo(event.deviceInfoRequest);
    }
  }

  Stream<DeviceInfoState> saveDeviceInfo(DeviceInfoRequest deviceInfoRequest) async* {
    yield* _setIsLoading(true);
    var result = await deviceInfoUseCase.saveDeviceInfo(deviceInfoRequest);
    yield* _setIsLoading(false);
    yield* result.fold(
            (l) async* {
          sharedPreferenceModule.saveUserData(jsonEncode(l));
          yield DeviceInfoSuccessResult(
              deviceInfoEntity: l);
        },
            (r) async* {
          yield DeviceInfoStateErrorResult(message: r.message);
        }
    );
  }

}