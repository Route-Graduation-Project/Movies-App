import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseDataSource {
  Future<User?> firebaseSignInWithGoogle();
}
