import 'package:movies_app/data/models/login_responce.dart';

import '../entity/register_response_entity.dart';

// all func that in API
abstract interface class ApiRemoteData{

  Future<LoginResponse> loginWithEmailAndPassword(
      String email,
      String password,
      );

  Future<RegisterResponseEntity> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  });
}