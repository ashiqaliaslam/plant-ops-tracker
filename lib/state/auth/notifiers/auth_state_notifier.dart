// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:plant_ops_tracker/state/auth/backend/authenticator.dart';
// import 'package:plant_ops_tracker/state/auth/models/auth_result.dart';
// import 'package:plant_ops_tracker/state/auth/models/app_state.dart';
// import 'package:plant_ops_tracker/state/auth/user_id.dart';
// import 'package:plant_ops_tracker/state/user_info/backend/user_info_storage.dart';

// class AuthStateNotifier extends StateNotifier<AuthStateApp> {
//   final _authenticator = const Authenticator();
//   final _userInfoStorage = const UserInfoStorage();

//   AuthStateNotifier() : super(const AuthStateApp.unKnown()) {
//     if (_authenticator.isAlreadyLoggedIn) {
//       state = AuthStateApp(
//           result: AuthResult.success,
//           isLoading: false,
//           userId: _authenticator.userId);
//     }
//   }

//   Future<void> logOut() async {
//     state = state.copiedWithIsLoading(true);
//     await _authenticator.logOut();
//     state = const AuthStateApp.unKnown();
//   }

//   Future<void> saveUserInfo({required UserId userId}) =>
//       _userInfoStorage.saveUserInfo(
//         userId: userId,
//         displayName: _authenticator.displayName,
//         email: _authenticator.email,
//       );
// }
