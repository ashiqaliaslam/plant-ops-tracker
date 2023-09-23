import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/notifiers/app_state.dart';

import '../../state/auth/app_state.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(applicationStateProvider);
    // final isEmailVerified = ref.watch(userEmailVerifiedProvider);
    // final refreshLoggedInUser = ref.watch(refreshLoggedInUserProvider);
    return ProfileScreen(
      appBar: AppBar(title: const Text('User Profile')),
      key: ValueKey(appState.emailVerified),
      providers: const [],
      actions: [
        SignedOutAction(
          ((context) {
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
              ref.read(applicationStateProvider.notifier).refreshLoggedInUser();
            },
          ),
        ),
      ],
    );
  }
}
