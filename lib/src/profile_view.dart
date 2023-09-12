import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, _) => ProfileScreen(
        appBar: AppBar(title: const Text('User Profile')),
        key: ValueKey(appState.emailVerified),
        providers: const [],
        actions: [
          SignedOutAction(
            ((context) {
              // context.pushReplacement('/');
              context.go('/');
            }),
          ),
        ],
        children: [
          Visibility(
              visible: !appState.emailVerified,
              child: OutlinedButton(
                child: const Text('Recheck Verification State'),
                onPressed: () {
                  appState.refreshLoggedInUser();
                },
              ))
        ],
      ),
    );
  }
}
