import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({
    super.key,
    required this.arguments,
  });

  final Map<String, String> arguments;

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordScreen(
      email: arguments['email'],
      headerMaxExtent: 200,
    );
  }
}
