import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/data/login/remote/dto/login_request.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/login/entity/login_entity.dart';
import 'package:clean_with_bloc_practice/domain/login/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<LoginEntity, Failure>> login(LoginRequest loginRequest) async {
    return await loginRepository.login(loginRequest);
  }

}