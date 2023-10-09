import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const appName = 'Plant Ops Tracker';
  static const welcomeToAppName = 'Welcome to ${Strings.appName}';
  static const noAudits = 'There are no audits today';
  static const noTalk = 'There is no talk today';
  static const enterYourSearchTerm =
      'You can search in description of all audits';
  static const google = 'Google';
  static const googleSignupUrl = 'https://accounts.google.com/signup';
  static const logIntoYourAccount =
      'Log into your accout using one of the options below.';

  static const createNewAudit = 'Create New Audit';
  static const createNewAuditHere = 'Create New Audit Here';
  static const createNewTalk = 'Create New Audit';

  static const dontHaveGoogleAccount = 'Don\'t have a google account';
  static const signUpOn = 'Sign up on';
  static const orCreateAnAccountOn = ' or create an accout on';

  static const comments = 'Comments';
  // static const writeYourCommentHere = 'Write your comment here...';
  // static const checkOutThisPost = 'Check out this post!';
  // static const postDetails = 'Post Details';
  // static const post = 'post';

  // static const createNewPost = 'Create New Post';
  // static const pleaseWriteYourMessageHere = 'Please write your message here';

  static const noCommentsYet =
      'Nobody has commented on this post yet. You can change that though, and be the first person who comments!';

  static const enterYourSearchTermHere = 'Enter your search term here';

  // login view rich text at bottom
  static const dontHaveAnAccount = "Don't have an account?\n";

  // static const comment = 'comment';

  static const loading = 'Loading...';

  // static const person = 'person';
  // static const people = 'people';
  // static const likedThis = 'liked this';

  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis =
      'Are you sure you want to delete this';

  // log out
  static const logOut = 'Log out';
  static const areYouSureThatYouWantToLogOutOfTheApp =
      'Are you sure that you want to log out of the app?';
  static const cancel = 'Cancel';

  const Strings._();
}
