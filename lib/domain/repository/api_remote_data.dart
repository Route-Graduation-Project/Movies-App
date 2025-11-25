import 'package:movies_app/data/models/login_responce.dart';

abstract interface class ApiRemoteData{

  Future<LoginResponse> loginWithEmailAndPassword(
      String email,
      String password,
      );

}