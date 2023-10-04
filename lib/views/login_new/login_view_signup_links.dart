import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/components/rich_text/base_text.dart';
import 'package:plant_ops_tracker/views/components/rich_text/rich_text_widget.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewSignupLinks extends StatelessWidget {
  const LoginViewSignupLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll:
          Theme.of(context).textTheme.labelMedium?.copyWith(height: 1.5),
      texts: [
        BaseText.plain(text: Strings.dontHaveAnAccount),
        BaseText.plain(text: Strings.signUpOn),
        BaseText.plain(text: Strings.orCreateAnAccountOn),
        BaseText.link(
          text: Strings.google,
          onTapped: () {
            launchUrl(Uri.parse(Strings.googleSignupUrl));
          },
        )
      ],
    );
  }
}
