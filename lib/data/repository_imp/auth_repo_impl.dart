import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/data/models/login_request.dart';
import 'package:movies_app/data/models/login_responce.dart';
import 'package:movies_app/domain/entity/register_response_entity.dart';
import 'package:movies_app/domain/repository/api_remote_data.dart';
import 'package:movies_app/domain/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiAuthRepoImpl implements AuthRepository {
  ApiRemoteData apiRemoteDataSource;

  ApiAuthRepoImpl(this.apiRemoteDataSource);

  @override
  Future<LoginResponse> loginWithEmailAndPassword(
    LoginRequest loginRequest,
  ) async {
    try {
      var connected = await _isConnected();
      if (connected) {
        var response = await apiRemoteDataSource.loginWithEmailAndPassword(
          loginRequest.email,
          loginRequest.password,
        );
        await _saveToken(response.token);
        return response;
      } else {
        throw ("There is no connection. Check your connection and try again");
      }
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
      var connected = await _isConnected();
      if (connected) {
        var response = await apiRemoteDataSource.register(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          phone: phone,
          avatarId: avatarId,
        );

        return response;
      } else {
        throw ("There is no connection. Check the connection and try again");
      }
    } catch (e) {
      rethrow;
    }
  }

  // check connection of internet
  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return (connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile));
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
  }

  @override
  Future<User?> firebaseSignInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;
    signIn.initialize(
      serverClientId:
          "923035564460-e7co4htua81t9qgr7ot0jl61pdh5evts.apps.googleusercontent.com",
    );

    final GoogleSignInAccount googleUser =
        await GoogleSignIn.instance.authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    final firebaseUser = userCredential.user;
    return firebaseUser;
  }
}
