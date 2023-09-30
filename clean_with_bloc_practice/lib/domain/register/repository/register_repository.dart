import 'package:dartz/dartz.dart';
import 'package:clean_with_bloc_practice/data/register/remote/dto/register_request.dart';
import 'package:clean_with_bloc_practice/domain/common/base/base_failure.dart';
import 'package:clean_with_bloc_practice/domain/register/entity/register_entity.dart';

abstract class RegisterRepository {
  Future<Either<RegisterEntity, Failure>> register(RegisterRequest registerRequest);
}