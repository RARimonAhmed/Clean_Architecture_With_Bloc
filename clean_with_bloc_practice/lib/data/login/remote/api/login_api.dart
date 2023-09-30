import 'package:clean_with_bloc_practice/data/login/remote/dto/login_request.dart';
import 'package:clean_with_bloc_practice/domain/login/entity/login_entity.dart';

abstract class LoginApi {
  Future<LoginEntity> login(LoginRequest loginRequest);
}
