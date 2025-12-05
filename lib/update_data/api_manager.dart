import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_response.dart';

class ApiManager{
  String url = "https://route-movie-apis.vercel.app/profile";
  late String token;

  Future<void> getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("token") ?? "";
  }

  Future<ProfileResponse> getProfile() async {
    await getToken();
    Dio dio = Dio();
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);

    return profileResponse;
  }
}

