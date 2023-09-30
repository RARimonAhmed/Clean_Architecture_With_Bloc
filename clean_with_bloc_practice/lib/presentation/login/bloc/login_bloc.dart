import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_with_bloc_practice/data/common/module/shared_pref_module.dart';
import 'package:clean_with_bloc_practice/data/login/remote/dto/login_request.dart';
import 'package:clean_with_bloc_practice/domain/login/usecase/login_usecase.dart';
import 'package:clean_with_bloc_practice/presentation/login/bloc/login_event.dart';
import 'package:clean_with_bloc_practice/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final SharedPreferenceModule sharedPreferenceModule;

  LoginBloc({required this.loginUseCase, required this.sharedPreferenceModule}) : super(LoginStateInit());

  Stream<LoginState> _setIsLoading(bool isLoading) async* {
    yield LoginStateLoading(isLoading: isLoading);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is LoginEventDoLogin){
      yield* login(event.loginRequest);
    }
  }

  Stream<LoginState> login(LoginRequest loginRequest) async* {
    yield* _setIsLoading(true);
    var result = await loginUseCase.login(loginRequest);
    yield* _setIsLoading(false);
    yield* result.fold(
      (l) async* {
        sharedPreferenceModule.saveUserData(jsonEncode(l));
        yield LoginStateSuccessLogin(loginEntity: l);
      }, 
      (r) async* {
        yield LoginStateErrorLogin(message: r.message);
      }
    );
  }

}