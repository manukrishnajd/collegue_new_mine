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
        return macos;
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
    apiKey: 'AIzaSyBBL6f6kPXNbh8K4-lJZic8z1obhLMS8OA',
    appId: '1:962311519572:web:b2bdb0bca4b462dff65cc1',
    messagingSenderId: '962311519572',
    projectId: 'collegue-17449',
    authDomain: 'collegue-17449.firebaseapp.com',
    storageBucket: 'collegue-17449.appspot.com',
    measurementId: 'G-CPVEQHYH8Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_D0ukVXpovw-0iGbXZOysX2xHmBz-Xu0',
    appId: '1:962311519572:android:119e257428b5690af65cc1',
    messagingSenderId: '962311519572',
    projectId: 'collegue-17449',
    storageBucket: 'collegue-17449.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgmvzrWtVlhqp5RnzhFb3-wKtXvBZdPpU',
    appId: '1:962311519572:ios:e04f581b13f63aa0f65cc1',
    messagingSenderId: '962311519572',
    projectId: 'collegue-17449',
    storageBucket: 'collegue-17449.appspot.com',
    iosBundleId: 'com.example.collegeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgmvzrWtVlhqp5RnzhFb3-wKtXvBZdPpU',
    appId: '1:962311519572:ios:75f82cad6af412d6f65cc1',
    messagingSenderId: '962311519572',
    projectId: 'collegue-17449',
    storageBucket: 'collegue-17449.appspot.com',
    iosBundleId: 'com.example.collegeApp.RunnerTests',
  );
}
