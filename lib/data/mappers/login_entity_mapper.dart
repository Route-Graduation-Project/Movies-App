import 'package:movies_app/data/models/login_responce.dart';
import 'package:movies_app/domain/entity/login_respone_entity.dart';

class LoginEntityMapper {
  static LoginResponseEntity converterToLoginEntity(LoginResponse response) {
    return LoginResponseEntity(
      token: response.token,
      message: response.message,
    );
  }
}



