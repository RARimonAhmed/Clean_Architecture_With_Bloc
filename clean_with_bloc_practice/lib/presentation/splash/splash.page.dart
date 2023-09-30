import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_with_bloc_practice/data/common/module/shared_pref_module.dart';
import 'package:clean_with_bloc_practice/main.dart';
import 'package:clean_with_bloc_practice/presentation/common/infra/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/save_device_info.dart';
import '../../data/save_device_info_data/remote/dto/save_device_info_request.dart';
import '../../domain/save_device_info_domain/entity/save_device_info_entity.dart';
import '../save_device_info_pr/bloc/save_device_info_bloc.dart';
import '../save_device_info_pr/bloc/save_device_info_event.dart';
import '../save_device_info_pr/bloc/save_device_info_state.dart';

class SplashPage extends StatefulWidget {
  final DeviceInfoBloc deviceInfoBloc;
  const SplashPage(
      {Key? key, required this.deviceInfoBloc})
      : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SharedPreferenceModule pref = sl.get();
  DeviceDetails deviceDetails = DeviceDetails();

  DeviceInfoEntity? deviceInfoEntity;


  deviceInformation() async {
    deviceInfoEntity =  await deviceDetails.getDeviceInformation("It will set");
    _doSaveDeviceInfo();
  }

  @override
  void initState() {
    super.initState();
    deviceInformation();
    startSplash();
  }

  startSplash() async {
    return Timer(const Duration(seconds: 5), () {
      if (pref.getUserData().isNotEmpty) {
        Navigator.pushReplacementNamed(context, AppRouter.ROUTE_HOME);
      } else {
        Navigator.pushReplacementNamed(context, AppRouter.ROUTE_LOGIN);
      }
    });
  }

  void _handleState(state) {
    if (state is DeviceInfoSuccessResult) {
    } else if (state is DeviceInfoStateErrorResult) {
      _showAlert(state.message);
    } else if (state is DeviceInfoLoadingState) {
    }
  }

  void _showAlert(String message) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"))
            ],
          );
        });
  }

  void _doSaveDeviceInfo() {
    widget.deviceInfoBloc.add(
      DeviceInfoEventDo(
        deviceInfoRequest: DeviceInfoRequest(
            userId: deviceInfoEntity!.userId,
            deviceUuid: deviceInfoEntity!.deviceUuid,
            deviceDensity: deviceInfoEntity!.deviceDensity,
            deviceWidth: deviceInfoEntity!.deviceWidth,
            deviceHeight: deviceInfoEntity!.deviceHeight,
            deviceToken: deviceInfoEntity!.deviceToken,
            deviceType: deviceInfoEntity!.deviceType,
            appVersionName: deviceInfoEntity!.appVersionName,
            appVersionCode: deviceInfoEntity!.appVersionCode,
            permissions: deviceInfoEntity!.permissions,
            deviceImei: deviceInfoEntity!.deviceImei,
            deviceManufacturer: deviceInfoEntity!.deviceManufacturer,
            deviceBrand: deviceInfoEntity!.deviceBrand,
            deviceProduct: deviceInfoEntity!.deviceProduct,
            deviceModel: deviceInfoEntity!.deviceModel,
            deviceOsVersion: deviceInfoEntity!.deviceOsVersion,
            deviceSdkVersion: deviceInfoEntity!.deviceSdkVersion,
            packageName: deviceInfoEntity!.packageName,
            doyaUpdateDate: deviceInfoEntity!.doyaUpdateDate,
            notificationStatus: deviceInfoEntity!.notificationStatus),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<DeviceInfoBloc, DeviceInfoState>(
          bloc: widget.deviceInfoBloc,
          listener: (context, state) {
            _handleState(state);
          },
          builder: (context, state) {
            return const Center(
              child: Text("Splash screen"),
            );
          },
        ),
      ),
    );
  }
}
