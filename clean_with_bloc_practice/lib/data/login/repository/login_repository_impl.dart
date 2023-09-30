import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/data/common/errors/error.mapper.dart';
import 'package:clean_with_bloc_practice/data/login/remote/api/login_api.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_exception.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/login/entity/login_entity.dart';
import 'package:clean_with_bloc_practice/data/login/remote/dto/login_request.dart';
import 'package:clean_with_bloc_practice/domain/login/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi loginApi;

  LoginRepositoryImpl({ required this.loginApi });

  @override
  Future<Either<LoginEntity, Failure>> login(LoginRequest loginRequest) async {
    try{
      var result = await loginApi.login(loginRequest);
      return Left(result);
    } on BaseException catch(e){
      return Right(BaseFailure(message: e.message, code: e.code!));
      // String errorMessage = ErrorMapper.getErrorMessage(e.httpStatusCode);
      // return Right(Failure(message: errorMessage));
    }
  }
  
}
