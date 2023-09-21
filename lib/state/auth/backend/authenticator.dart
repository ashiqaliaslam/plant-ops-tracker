// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:plant_ops_tracker/state/auth/user_id.dart';

// class Authenticator {
//   const Authenticator();

//   // getters

//   bool get isAlreadyLoggedIn => userId != null;
//   UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

//   String get displayName =>
//       FirebaseAuth.instance.currentUser?.displayName ?? '';

//   String? get email => FirebaseAuth.instance.currentUser?.email;

//   bool? get userEmailVerified =>
//       FirebaseAuth.instance.currentUser?.emailVerified;

//   Future<void> logOut() async {
//     await FirebaseAuth.instance.signOut();
//     // await GooggleSignIn().signOut();
//   }

//   Future<void> refreshLoggedInUser() async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       return;
//     }

//     await currentUser.reload();
//   }
// }
