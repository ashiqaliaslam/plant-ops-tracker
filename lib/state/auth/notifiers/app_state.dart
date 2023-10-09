// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:plant_ops_tracker/state/auth/user_id.dart';

// final applicationStateProvider =
//     StateNotifierProvider<ApplicationState, ApplicationStateData>(
//         (ref) => ApplicationState());

// class ApplicationStateData {
//   final bool loggedIn;
//   final bool emailVerified;
//   final String username;
//   final String email;
//   final String photoURL;
//   final bool isLoading;
//   final UserId? userId;

//   ApplicationStateData({
//     required this.loggedIn,
//     required this.emailVerified,
//     this.username = '',
//     this.email = '',
//     this.photoURL = '',
//     this.isLoading = false,
//     this.userId,
//   });

//   ApplicationStateData copyWith({
//     bool? loggedIn,
//     bool? emailVerified,
//     String? username,
//     String? email,
//     String? photoURL,
//     bool? isLoading,
//     UserId? userId,
//   }) {
//     return ApplicationStateData(
//       loggedIn: loggedIn ?? this.loggedIn,
//       emailVerified: emailVerified ?? this.emailVerified,
//       username: username ?? this.username,
//       email: email ?? this.email,
//       photoURL: photoURL ?? this.photoURL,
//       isLoading: isLoading ?? this.isLoading,
//       userId: userId ?? this.userId,
//     );
//   }
// }

// class ApplicationState extends StateNotifier<ApplicationStateData> {
//   ApplicationState()
//       : super(ApplicationStateData(
//           loggedIn: false,
//           emailVerified: false,
//           isLoading: false,
//           userId: null,
//         )) {
//     init();
//   }

//   Future<void> init() async {
//     // set isLoading to true at start of init
//     state = state.copyWith(isLoading: true);

//     FirebaseUIAuth.configureProviders([
//       EmailAuthProvider(),
//     ]);

//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         state = ApplicationStateData(
//           loggedIn: true,
//           emailVerified: true,
//           username: user.displayName ?? '',
//           email: user.email ?? '',
//           photoURL: user.photoURL ?? '',
//           isLoading: false, // false when loggedIn done
//           userId: user.uid,
//         );
//       } else {
//         state = ApplicationStateData(
//           loggedIn: false,
//           emailVerified: false,
//           isLoading: false, // false when loggedOut done
//           userId: null,
//         );
//       }
//     });
//   }

//   Future<void> refreshLoggedInUser() async {
//     // Set isLoading to true at the start of refreshLoggedInUser
//     state = state.copyWith(isLoading: true);

//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       return;
//     }

//     await currentUser.reload();
//     state = state.copyWith(
//       isLoading: false,
//     ); // false when refresh done
//   }

//   // method to update isLoading
//   void setLoading(bool value) {
//     state = state.copyWith(isLoading: true);
//   }
// }

// // class ApplicationState extends ChangeNotifier {
// //   ApplicationState() {
// //     init();
// //   }

// //   bool loggedIn = false;

// //   bool emailVerified = false;

// //   Future<void> init() async {
// //     FirebaseUIAuth.configureProviders([
// //       EmailAuthProvider(),
// //     ]);

// //     FirebaseAuth.instance.userChanges().listen((user) {
// //       if (user != null) {
// //         loggedIn = true;
// //         emailVerified = true;
// //         notifyListeners();
// //       } else {
// //         loggedIn = false;
// //         emailVerified = false;
// //         notifyListeners();
// //       }
// //     });
// //   }

// //   Future<void> refreshLoggedInUser() async {
// //     final currentUser = FirebaseAuth.instance.currentUser;

// //     if (currentUser == null) {
// //       return;
// //     }

// //     await currentUser.reload();
// //   }
// // }
