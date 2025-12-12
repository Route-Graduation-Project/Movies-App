import 'package:dio/dio.dart';
import 'package:movies_app/update_data/message_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_response.dart';

class ApiManager {
  String url = "https://route-movie-apis.vercel.app/profile";
  late String token;

  Future<void> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token") ?? "";
  }

  Future<void> _deleteToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
  }

  Future<ProfileResponse> getProfile() async {
    await _getToken();
    Dio dio = Dio();
    final response = await dio.get(
      url,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);

    return profileResponse;
  }

  Future<MessageResponse> updateProfile({String? name, String? phone, int? avatarId}) async {
    await _getToken();
    Dio dio = Dio();
    final body = {
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (avatarId != null) 'avaterId': avatarId,
    };
    var response = await dio.patch(
      url,
      data: body,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    MessageResponse messageResponse = MessageResponse.fromJson(response.data);
    return messageResponse;
  }

  Future<MessageResponse> deleteProfile() async {
    await _getToken();
    Dio dio = Dio();
    var response = await dio.delete(
      url,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    await _deleteToken();

    MessageResponse messageResponse = MessageResponse.fromJson(response.data);
    return messageResponse;
  }
}
