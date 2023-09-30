import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/data/login/remote/dto/login_request.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/login/entity/login_entity.dart';

abstract class LoginRepository {
  Future<Either<LoginEntity, Failure>> login(LoginRequest loginRequest);
}
