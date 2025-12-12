import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository/firebase_data_source.dart';

@Injectable(as: FirebaseDataSource)
class FirebaseDataSourceImpl implements FirebaseDataSource {
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

    return userCredential.user;
  }
}
