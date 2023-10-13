import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_ops_tracker/views/widgets/styled_button.dart';

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
                Navigator.pop(context); // pop drawer after tapping PROFILE
                context.push('/profile');
              },
              child: const Text('Profile')),
        ));
  }
}
