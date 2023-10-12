import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plant_ops_tracker/state/auth/providers/auth_state_provider.dart';
import 'package:plant_ops_tracker/views/components/dialogs/alert_dialog_model.dart';
import 'package:plant_ops_tracker/views/components/dialogs/logout_dialog.dart';
import 'package:plant_ops_tracker/views/widgets/styled_button.dart';

class LoginLogoutButton extends ConsumerWidget {
  const LoginLogoutButton({
    super.key,
    required this.loggedIn,
    // required this.signOut,
  });

  final bool loggedIn;
  // final void Function() signOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 8),
      child: StyledButton(
          onPressed: () async {
            if (!loggedIn) {
              context.push('/sign-in');
              // Navigator.pop(context); // [working]
            } else {
              final shouldLogOut = await const LogoutDialog()
                  .present(context)
                  .then((value) => value ?? false);
              if (shouldLogOut) {
                await ref.read(authStateProvider.notifier).logOut();
                await ref
                    .read(authStateProvider.notifier)
                    .refreshLoggedInUser();
                // rootNavigatorKey.currentState
                //     ?.pushReplacementNamed('audit_list_view');
              }
            }
            // Navigator.pop(context);
            // },
          },
          child: !loggedIn
              ? const Text('Sign In to Create')
              : const Text('Logout')),
    );
  }
}


               // TextButton(
                //   onPressed: () async {
                //     // Navigator.of(context);
                //     if (!loggedIn) {
                //       context.push('/sign-in');
                //       // Navigator.pop(context); // [working]
                //     } else {
                //       final shouldLogOut = await const LogoutDialog()
                //           .present(context)
                //           .then((value) => value ?? false);
                //       if (shouldLogOut) {
                //         await ref.read(authStateProvider.notifier).logOut();
                //         // await ref
                //         //     .read(authStateProvider.notifier)
                //         //     .refreshLoggedInUser();
                //         // rootNavigatorKey.currentState
                //         //     ?.pushReplacementNamed('audit_list_view');
                //       }
                //     }
                //     // Navigator.pop(context);
                //   },
                //   child: !loggedIn
                //       ? const Text('Sign in to Create')
                //       : const Text('Log out'),
                // ),