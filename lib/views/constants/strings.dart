import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const appName = 'Plant Ops Tracker';
  static const wellcomeToAppName = 'Welcome to ${Strings.appName}';
  static const noAudits = 'There are no audits today';
  static const noTalk = 'There is no talk today';
  static const enterYourSearchTerm =
      'You can search in description of all audits';
  static const google = 'Google';
  static const googleSignupUrl = 'https://accounts.google.com/signup';
  static const logIntoYourAccount =
      'Log into your accout using one of the options below.';

  static const createNewAudit = 'Create New Audit';
  static const createNewTalk = 'Create New Audit';

  static const dontHaveGoogleAccount = 'Don\'t have a google account';
  static const signUpOn = 'Sign up on';
  static const orCreateAnAccountOn = ' or create an accout on';

  const Strings._();
}
