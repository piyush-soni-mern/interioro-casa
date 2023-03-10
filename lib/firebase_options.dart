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
    apiKey: 'AIzaSyDOdVpMXxiEpBFCvPnUTNMf0yEn5Gtd_mQ',
    appId: '1:243926494746:web:9f8167edb022f422696ba3',
    messagingSenderId: '243926494746',
    projectId: 'interioro-casa-eventnet',
    authDomain: 'interioro-casa-eventnet.firebaseapp.com',
    storageBucket: 'interioro-casa-eventnet.appspot.com',
    measurementId: 'G-99NXHQ4XSL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX2phpRA-eO-qh0RSVwjETUaBHEQ2GBQY',
    appId: '1:243926494746:android:87884329547193c8696ba3',
    messagingSenderId: '243926494746',
    projectId: 'interioro-casa-eventnet',
    storageBucket: 'interioro-casa-eventnet.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLj3nhykRh604_8vw0kczxRUZJyn01u4c',
    appId: '1:243926494746:ios:b56f8e575f656b2c696ba3',
    messagingSenderId: '243926494746',
    projectId: 'interioro-casa-eventnet',
    storageBucket: 'interioro-casa-eventnet.appspot.com',
    iosClientId: '243926494746-qhl0gn69l5b8clcib0hahotki2d20hth.apps.googleusercontent.com',
    iosBundleId: 'com.example.interioroCasa',
  );
}
