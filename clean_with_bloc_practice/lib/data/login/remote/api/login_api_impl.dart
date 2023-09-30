import 'package:dio/dio.dart';
import 'package:clean_with_bloc_practice/data/common/response/response_wrapper.dart';
import 'package:clean_with_bloc_practice/data/login/remote/api/login_api.dart';
import 'package:clean_with_bloc_practice/data/login/remote/dto/login_request.dart';
import 'package:clean_with_bloc_practice/data/login/remote/dto/login_response.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_exception.dart';
import 'package:clean_with_bloc_practice/domain/login/entity/login_entity.dart';

class LoginApiImpl implements LoginApi {
  final Dio dio;

  LoginApiImpl({required this.dio});

  @override
  Future<LoginEntity> login(LoginRequest loginRequest) async {
    try{
      final response = await dio.post("auth/login", data: loginRequest.toJson());
      var converted = WrappedResponse<LoginResponse>.fromJson(response.data, (data) => LoginResponse.fromJson(data));
      if(response.statusCode == 200){
        return LoginEntity(
          id: converted.data!.id!, 
          token: converted.data!.token!, 
          email: converted.data!.email!, 
          name: converted.data!.name!
        );
      }
      throw BaseException(message: converted.message_bn.toString(), code: response.statusCode);
    }on DioException catch(e){
      throw BaseException(message: e.message.toString(), code: e.response?.statusCode);
    }on Exception catch(e){
      throw BaseException(message: e.toString());
    }
  }
}
