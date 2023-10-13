import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final appState = ref.watch(applicationStateProvider);
    final isEmailVerified = ref.watch(authStateProvider).emailVerified;

    // final refreshLoggedInUser = ref.watch(refreshLoggedInUserProvider);
    return ProfileScreen(
      appBar: AppBar(title: const Text('User Profile')),
      key: ValueKey(isEmailVerified),
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
          visible: !isEmailVerified,
          child: OutlinedButton(
            child: const Text('Recheck Verification State'),
            onPressed: () {
              ref.read(authStateProvider.notifier).refreshLoggedInUser();
            },
          ),
        ),
      ],
    );
  }
}
