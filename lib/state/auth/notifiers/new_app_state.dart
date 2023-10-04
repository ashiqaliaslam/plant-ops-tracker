import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final applicationStateProvider =
    StateNotifierProvider<ApplicationState, ApplicationStateData>(
        (ref) => ApplicationState());

class ApplicationStateData {
  final bool loggedIn;
  final bool emailVerified;
  final String username;
  final String email;
  final String photoURL;

  ApplicationStateData(
      {required this.loggedIn,
      required this.emailVerified,
      this.username = '',
      this.email = '',
      this.photoURL = ''});
}

class ApplicationState extends StateNotifier<ApplicationStateData> {
  ApplicationState()
      : super(ApplicationStateData(loggedIn: false, emailVerified: false)) {
    init();
  }

  Future<void> init() async {
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        state = ApplicationStateData(
          loggedIn: true,
          emailVerified: true,
          username: user.displayName ?? '',
          email: user.email ?? '',
          photoURL: user.photoURL ?? '',
        );
      } else {
        state = ApplicationStateData(
          loggedIn: false,
          emailVerified: false,
        );
      }
    });
  }

  Future<void> refreshLoggedInUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return;
    }

    await currentUser.reload();
  }
}

// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }

//   bool loggedIn = false;

//   bool emailVerified = false;

//   Future<void> init() async {
//     FirebaseUIAuth.configureProviders([
//       EmailAuthProvider(),
//     ]);

//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         loggedIn = true;
//         emailVerified = true;
//         notifyListeners();
//       } else {
//         loggedIn = false;
//         emailVerified = false;
//         notifyListeners();
//       }
//     });
//   }

//   Future<void> refreshLoggedInUser() async {
//     final currentUser = FirebaseAuth.instance.currentUser;

//     if (currentUser == null) {
//       return;
//     }

//     await currentUser.reload();
//   }
// }
