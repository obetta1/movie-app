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
    apiKey: 'AIzaSyAUxqSUN6lX7f7L5kzXBbOxej7k4KAQhbs',
    appId: '1:881933589584:web:43a7b73d2ba203977e0555',
    messagingSenderId: '881933589584',
    projectId: 'movi-app-7d1ff',
    authDomain: 'movi-app-7d1ff.firebaseapp.com',
    storageBucket: 'movi-app-7d1ff.appspot.com',
    measurementId: 'G-L6C737X7R3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARwecb87_8eHcmnFGdzBXcF7XLH50WG8s',
    appId: '1:881933589584:android:40d5c43317f410e17e0555',
    messagingSenderId: '881933589584',
    projectId: 'movi-app-7d1ff',
    storageBucket: 'movi-app-7d1ff.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDeWdqE_5tTVDOgOGVEXetIHXASpzxqnRg',
    appId: '1:881933589584:ios:debdb9da321e9d747e0555',
    messagingSenderId: '881933589584',
    projectId: 'movi-app-7d1ff',
    storageBucket: 'movi-app-7d1ff.appspot.com',
    iosBundleId: 'com.example.moviApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDeWdqE_5tTVDOgOGVEXetIHXASpzxqnRg',
    appId: '1:881933589584:ios:debdb9da321e9d747e0555',
    messagingSenderId: '881933589584',
    projectId: 'movi-app-7d1ff',
    storageBucket: 'movi-app-7d1ff.appspot.com',
    iosBundleId: 'com.example.moviApp',
  );
}
