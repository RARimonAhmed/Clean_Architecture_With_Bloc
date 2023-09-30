import 'package:clean_with_bloc_practice/data/save_device_info_data/remote/dto/save_device_info_request.dart';
import 'package:clean_with_bloc_practice/domain/save_device_info_domain/entity/save_device_info_entity.dart';
import 'package:clean_with_bloc_practice/presentation/save_device_info_pr/bloc/save_device_info_bloc.dart';
import 'package:clean_with_bloc_practice/presentation/save_device_info_pr/bloc/save_device_info_event.dart';
import 'package:clean_with_bloc_practice/presentation/save_device_info_pr/bloc/save_device_info_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceInfoPage extends StatefulWidget {
  final DeviceInfoBloc deviceInfoBloc;
  final DeviceInfoEntity deviceInfoEntity;
  const DeviceInfoPage(
      {Key? key, required this.deviceInfoBloc, required this.deviceInfoEntity})
      : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  bool _isLoading = false;
  // bool _isShowPassword = false;
  // final _formKey = GlobalKey<FormState>();
  // final _emailTextFieldController = TextEditingController();
  // final _passwordTextFieldController = TextEditingController();

  @override
  void initState() {
    _doSaveDeviceInfo();
    super.initState();
  }

  void _handleState(state) {
    if (state is DeviceInfoSuccessResult) {
      // Navigator.pushReplacementNamed(context, AppRouter.ROUTE_HOME);
      print("Rimon debugging : DeviceInfo handle state is success");
    } else if (state is DeviceInfoStateErrorResult) {
      _showAlert(state.message);
    } else if (state is DeviceInfoLoadingState) {
      _isLoading = state.isLoading;
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
                  onPressed: () => Navigator.pop(context), child: Text("OK"))
            ],
          );
        });
  }

  void _doSaveDeviceInfo() {
    // if (_formKey.currentState!.validate()) {
    //   String email = _emailTextFieldController.text.toString().trim();
    //   String password = _passwordTextFieldController.text.toString().trim();
    widget.deviceInfoBloc.add(DeviceInfoEventDo(
        deviceInfoRequest: DeviceInfoRequest(
            userId: widget.deviceInfoEntity.userId,
            deviceUuid: widget.deviceInfoEntity.deviceUuid,
            deviceDensity: widget.deviceInfoEntity.deviceDensity,
            deviceWidth: widget.deviceInfoEntity.deviceWidth,
            deviceHeight: widget.deviceInfoEntity.deviceHeight,
            deviceToken: widget.deviceInfoEntity.deviceToken,
            deviceType: widget.deviceInfoEntity.deviceType,
            appVersionName: widget.deviceInfoEntity.appVersionName,
            appVersionCode: widget.deviceInfoEntity.appVersionCode,
            permissions: widget.deviceInfoEntity.permissions,
            deviceImei: widget.deviceInfoEntity.deviceImei,
            deviceManufacturer: widget.deviceInfoEntity.deviceManufacturer,
            deviceBrand: widget.deviceInfoEntity.deviceBrand,
            deviceProduct: widget.deviceInfoEntity.deviceProduct,
            deviceModel: widget.deviceInfoEntity.deviceModel,
            deviceOsVersion: widget.deviceInfoEntity.deviceOsVersion,
            deviceSdkVersion: widget.deviceInfoEntity.deviceSdkVersion,
            packageName: widget.deviceInfoEntity.packageName,
            doyaUpdateDate: widget.deviceInfoEntity.doyaUpdateDate,
            notificationStatus: widget.deviceInfoEntity.notificationStatus)));
    // }
  }

  // void _goToRegisterPage() {
  //   Navigator.pushNamed(context, AppRouter.ROUTE_REGISTER);
  // }

  // Widget _headerWidget() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 36, left: 16, right: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         TextHeader(text: "Sign In"),
  //         Text(
  //             "Please sign in first to get all feature of this app. If you don't have any account, create a new one"),
  //       ],
  //     ),
  //   );
  // }

  Widget _loadingBar() {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 28, left: 16, right: 16),
      child: LinearProgressIndicator(
        value: _isLoading ? null : 0,
      ),
    );
  }

  // Widget _createAccountSection() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
  //     child: InkWell(
  //         onTap: () => {_goToRegisterPage()},
  //         child: Padding(
  //             padding: EdgeInsets.all(8),
  //             child: Text("Create a new account",
  //                 style: TextStyle(decoration: TextDecoration.underline)))),
  //   );
  // }

  // Widget _signInForm() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 16),
  //     child: Form(
  //       key: _formKey,
  //       child: Column(
  //         children: [
  //           TextFormField(
  //             controller: _emailTextFieldController,
  //             decoration: InputDecoration(
  //               hintText: "Email",
  //             ),
  //             validator: (value) {
  //               if (value == null || value.toString().trim().isEmpty) {
  //                 return "Email must not be empty";
  //               }
  //               return null;
  //             },
  //           ),
  //           SizedBox(height: 16),
  //           TextFormField(
  //             obscureText: !_isShowPassword,
  //             controller: _passwordTextFieldController,
  //             decoration: InputDecoration(
  //                 hintText: "Password",
  //                 suffixIcon: InkWell(
  //                   onTap: () => {
  //                     setState(() {
  //                       _isShowPassword = !_isShowPassword;
  //                     })
  //                   },
  //                   child: _isShowPassword
  //                       ? Icon(Icons.visibility_off)
  //                       : Icon(Icons.visibility),
  //                 )),
  //             validator: (value) {
  //               if (value == null || value.toString().trim().isEmpty) {
  //                 return "Password must not be empty";
  //               }
  //               return null;
  //             },
  //           ),
  //           SizedBox(
  //             height: 16,
  //           ),
  //           PrimaryButton(
  //             text: "Login",
  //             onClick: _isLoading ? null : _doLogin,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    child: BlocConsumer<DeviceInfoBloc, DeviceInfoState>(
      bloc: widget.deviceInfoBloc,
      listener: (context, state) {
        _handleState(state);
      },
      builder: (context, state) {
        return Column(
          children: [
            // _headerWidget(),
            _loadingBar(),
            // _signInForm(),
            // _createAccountSection()
          ],
        );
      },
    )))));
  }
}
