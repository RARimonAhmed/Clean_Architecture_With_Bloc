import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:clean_with_bloc_practice/data/common/response/response_wrapper.dart';
import 'package:clean_with_bloc_practice/data/register/remote/api/register_api.dart';
import 'package:clean_with_bloc_practice/data/register/remote/dto/register_response.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_exception.dart';
import 'package:clean_with_bloc_practice/domain/register/entity/register_entity.dart';
import 'package:clean_with_bloc_practice/data/register/remote/dto/register_request.dart';

class RegisterApiImpl implements RegisterApi {
  final Dio dio;

  RegisterApiImpl({required this.dio});

  @override
  Future<RegisterEntity> register(RegisterRequest registerRequest) async {
    try{
      final response = await dio.post("auth/register", data: registerRequest.toJson());
      var converted = WrappedResponse<RegisterResponse>.fromJson(response.data, (data) => RegisterResponse.fromJson(data));
      if(response.statusCode == 201){
        var registerEntity = RegisterEntity.toEntity(converted.data!);
        return registerEntity;
      }
      throw BaseException(message: converted.message_bn.toString(), code: response.statusCode);
    }on DioException catch(e){
      throw BaseException(message: e.message.toString(), code: e.response?.statusCode);
    }on Exception catch(e){
      throw BaseException(message: e.toString());
    }
  }

}