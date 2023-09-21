import 'package:flutter/material.dart';
import 'package:plant_ops_tracker/views/components/rich_text/base_text.dart';
import 'package:plant_ops_tracker/views/components/rich_text/rich_text_widget.dart';
import 'package:plant_ops_tracker/views/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupLinksView extends StatelessWidget {
  const SignupLinksView({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll:
          Theme.of(context).textTheme.labelMedium?.copyWith(height: 1.5),
      texts: [
        // BaseText.plain(text: ' '),
        BaseText.plain(text: 'Sign up on '),
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
