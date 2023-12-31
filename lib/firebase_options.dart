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
    apiKey: 'AIzaSyAg1O1OPdoLg4kscCxN7TXlg4fK1wZuAlg',
    appId: '1:779678397545:web:70bb70a6f733165cd15ef8',
    messagingSenderId: '779678397545',
    projectId: 'chat-app-62f03',
    authDomain: 'chat-app-62f03.firebaseapp.com',
    storageBucket: 'chat-app-62f03.appspot.com',
    measurementId: 'G-D05XCH7YQR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6zFYqbZ2pOlfoI9JIN9cs9CXtaYVPYS8',
    appId: '1:779678397545:android:a113bc4f51854c67d15ef8',
    messagingSenderId: '779678397545',
    projectId: 'chat-app-62f03',
    storageBucket: 'chat-app-62f03.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA856gwvTu0jN8UvjHefTI_2xzeew4XiRE',
    appId: '1:779678397545:ios:80d14874b4531db3d15ef8',
    messagingSenderId: '779678397545',
    projectId: 'chat-app-62f03',
    storageBucket: 'chat-app-62f03.appspot.com',
    iosClientId: '779678397545-daq0a0q51rvusndjctotf0e6jnduivci.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
