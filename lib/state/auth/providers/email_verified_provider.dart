// // import 'package:hooks_riverpod/hooks_riverpod.dart';
// // import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';

// // final userEmailVerifiedProvider = Provider((ref) {
// //   final authState = ref.watch(authStateProvider.notifier);
// //   return
// // });

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:plant_ops_tracker/state/auth/providers/authenticator_provider.dart';

// // final userEmailVerifiedProvider = Provider((ref) {
// //   final authState = ref.watch(authStateProvider);
// //   return authState.result == AuthResult.success &&
// //       const Authenticator().userEmailVerified == true;
// // });

// final userEmailVerifiedProvider = Provider((ref) {
//   final authenticator = ref.watch(authenticatorProvider);
//   return authenticator.userEmailVerified;
// });
// // final userEmailVerifiedProvider = Provider((ref) {
// //   return FirebaseAuth.instance.currentUser?.emailVerified;
// // });
