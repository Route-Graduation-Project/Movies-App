import 'package:movies_app/data/api_manager/api_client.dart';
import 'package:movies_app/data/api_manager/shared_dio.dart';
import 'package:movies_app/data/models/login_request.dart';
import 'package:movies_app/data/models/login_responce.dart';
import 'package:movies_app/domain/repository/api_remote_data.dart';

class ApiRemoteImpl implements ApiRemoteData {
  ApiClient apiClient = ApiClient(sharedDio());

  @override
  Future<LoginResponse> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var response = await apiClient.loginWithEmailAndPassword(
        LoginRequest(
          email: email,
          password: password,
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
