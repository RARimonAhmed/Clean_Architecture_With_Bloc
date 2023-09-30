import 'package:clean_with_bloc_practice/data/register/remote/dto/register_request.dart';
import 'package:clean_with_bloc_practice/domain/register/entity/register_entity.dart';

abstract class RegisterApi {
  Future<RegisterEntity> register(RegisterRequest registerRequest);
}