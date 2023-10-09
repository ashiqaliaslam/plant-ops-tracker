import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_ops_tracker/state/auth/app_state/auth_result.dart';
import 'package:plant_ops_tracker/state/auth/app_state/constants.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';

class Authenticator {
  const Authenticator();

  bool get isAlreadyLoggedIn => userId != null;
  bool get emailVerified =>
      FirebaseAuth.instance.currentUser?.emailVerified ?? false;
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  dynamic get currentUser => FirebaseAuth.instance.currentUser;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  dynamic get photoUrl => FirebaseAuth.instance.currentUser?.photoURL ?? '';
  String get email => FirebaseAuth.instance.currentUser?.email ?? '';

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        Constants.emailScope,
      ],
    );
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
