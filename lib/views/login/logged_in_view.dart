import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/styled_button.dart';

class LoggedInView extends StatelessWidget {
  const LoggedInView({
    super.key,
    required this.loggedIn,
    required this.signOut,
    // this.enableFreeSwag = true,
  });

  final bool loggedIn;
  final void Function() signOut;
  // final bool enableFreeSwag;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: StyledButton(
              onPressed: () {
                !loggedIn ? context.push('/sign-in') : signOut();
              },
              child: !loggedIn ? const Text('Sign in') : const Text('Logout')),
        ),
        Visibility(
            visible: loggedIn,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 8),
              child: StyledButton(
                  onPressed: () {
                    context.push('/profile');
                  },
                  child: const Text('Profile')),
            )),
        // Visibility(
        //   visible: enableFreeSwag,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 24, bottom: 8),
        //     child: StyledButton(
        //         onPressed: () {
        //           throw Exception('free swag unimplemented');
        //         },
        //         child: const Text('Free swag!')),
        //   ),
        // ),
      ],
    );
  }
}
