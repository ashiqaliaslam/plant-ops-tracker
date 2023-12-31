// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDTcawNyu9wIZGuSqv-udLHrDL7_VNnGCg',
    appId: '1:481212461105:web:4828ac7fee714b38e02510',
    messagingSenderId: '481212461105',
    projectId: 'opstracker-400a1',
    authDomain: 'opstracker-400a1.firebaseapp.com',
    storageBucket: 'opstracker-400a1.appspot.com',
    measurementId: 'G-MDSTQQXSW0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCU9u_1Kaz-AzkwqQvTDB-bLGELnTdgMRM',
    appId: '1:481212461105:android:46e62d73b4764792e02510',
    messagingSenderId: '481212461105',
    projectId: 'opstracker-400a1',
    storageBucket: 'opstracker-400a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZZpfCu8UaVCrvVoFx2wvcKrJLI6j7aVo',
    appId: '1:481212461105:ios:ca6887bb2a0ac2a9e02510',
    messagingSenderId: '481212461105',
    projectId: 'opstracker-400a1',
    storageBucket: 'opstracker-400a1.appspot.com',
    androidClientId:
        '481212461105-6j3o5oka70gjlikuoj1nd0tspnohhj8g.apps.googleusercontent.com',
    iosClientId:
        '481212461105-uo1hf3b0gttlt62k13rdihriq98rjapf.apps.googleusercontent.com',
    iosBundleId: 'com.example.plantOpsTracker',
  );
}
