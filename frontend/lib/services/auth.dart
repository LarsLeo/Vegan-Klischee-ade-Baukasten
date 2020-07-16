import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  static Future<FirebaseUser> signInAnonymous() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      return authResult.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
