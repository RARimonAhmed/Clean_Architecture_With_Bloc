import 'package:clean_with_bloc_practice/data/common/errors/error.mapper.dart';
import 'package:clean_with_bloc_practice/data/register/remote/api/register_api.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_exception.dart';
import 'package:clean_with_bloc_practice/domain/register/entity/register_entity.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/data/register/remote/dto/register_request.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/domain/register/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApi registerApi;

  RegisterRepositoryImpl({required this.registerApi});

  @override
  Future<Either<RegisterEntity, Failure>> register(RegisterRequest registerRequest) async {
    try{
      var response  = await registerApi.register(registerRequest);
      return Left(response);
    }on BaseException catch(e){
      return Right(BaseFailure(message: e.message, code: e.code!));
    }
  }
}