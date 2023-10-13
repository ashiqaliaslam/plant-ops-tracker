import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/app_state/auth_result.dart';
import 'package:plant_ops_tracker/state/auth/app_state/authenticator.dart';
import 'package:plant_ops_tracker/state/auth/app_state/user_auth_state.dart';
import 'package:plant_ops_tracker/state/auth/user_id.dart';
import 'package:plant_ops_tracker/state/user_info/backend/user_info_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppStateNotifier extends StateNotifier<UserAuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  get authenticator => _authenticator;

  AppStateNotifier() : super(const UserAuthState.unKnown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = UserAuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
        emailVerified: false,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const UserAuthState.unKnown();
    // rootNavigatorKey.currentState?.pushReplacementNamed('/'); // TODO: trial
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = UserAuthState(
      result: result,
      isLoading: false,
      userId: _authenticator.userId,
      emailVerified: _authenticator.emailVerified,
    );
  }

  Future<void> refreshLoggedInUser() async {
    // Set isLoading to true at the start of refreshLoggedInUser
    state = state.copiedWithIsLoading(true);

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }

    await currentUser.reload();
    state = state.copiedWithIsLoading(false); // false when refresh done
  }

  Future<void> saveUserInfo({required UserId userId}) =>
      _userInfoStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
        photoURL: _authenticator.photoUrl,
      );
}
