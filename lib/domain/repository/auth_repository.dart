import 'package:movies_app/data/models/login_request.dart';
import '../../data/models/login_responce.dart';
import '../entity/register_response_entity.dart';

abstract interface class AuthRepository {
  Future<LoginResponse> loginWithEmailAndPassword(LoginRequest loginRequest);

  Future<RegisterResponseEntity> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  });

  Future<void> firebaseSignInWithGoogle();
}
