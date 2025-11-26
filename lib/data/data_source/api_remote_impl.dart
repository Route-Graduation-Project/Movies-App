import 'package:movies_app/data/api_manager/api_client.dart';
import 'package:movies_app/data/api_manager/shared_dio.dart';
import 'package:movies_app/data/mappers/register_entity_mapper.dart';
import 'package:movies_app/data/models/login_request.dart';
import 'package:movies_app/data/models/login_responce.dart';
import 'package:movies_app/data/models/register_request.dart';
import 'package:movies_app/domain/entity/register_response_entity.dart';
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
        LoginRequest(email: email, password: password),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterResponseEntity> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) async {
    try {
      var response = await apiClient.register(
        RegisterRequest(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          phone: phone,
          avatarId: avatarId,
        ),
      );
      return RegisterEntityMapper().converterToRegisterEntity(response);
    } catch (e) {
      rethrow;
    }
  }
}
