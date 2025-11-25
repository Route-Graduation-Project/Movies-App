import 'package:movies_app/data/models/login_request.dart';

import '../../data/models/login_responce.dart';

abstract interface class AuthRepository{

  Future<LoginResponse> loginWithEmailAndPassword(
      LoginRequest loginRequest,
      );

}