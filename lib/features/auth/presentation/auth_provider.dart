import 'package:firebase_auth/firebase_auth.dart';

class AuthStateProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();
}
