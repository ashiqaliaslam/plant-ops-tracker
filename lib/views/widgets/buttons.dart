import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_ops_tracker/views/widgets/styled_button.dart';

class LoginLogoutButton extends StatelessWidget {
  const LoginLogoutButton({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 8),
      child: StyledButton(
          onPressed: () {
            !loggedIn ? context.push('/sign-in') : signOut();
          },
          child: !loggedIn
              ? const Text('Sign In to Create')
              : const Text('Logout')),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.loggedIn,
  });

  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: loggedIn,
        child: Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: StyledButton(
              onPressed: () {
                context.push('/profile');
              },
              child: const Text('Profile')),
        ));
  }
}
