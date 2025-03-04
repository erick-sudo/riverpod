// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDyRuNTbNUBdKAndjV-lHGvJN4paHfuVso',
    appId: '1:1086182683711:web:4481780fe6766c7500b48a',
    messagingSenderId: '1086182683711',
    projectId: 'sonorous-saga-449814-u7',
    authDomain: 'sonorous-saga-449814-u7.firebaseapp.com',
    storageBucket: 'sonorous-saga-449814-u7.firebasestorage.app',
    measurementId: 'G-0ZCS8Z3E8J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD62jhCXD4MvIOEZQDTI5Fkso-QuErbiu0',
    appId: '1:1086182683711:android:1b5d05126acc134500b48a',
    messagingSenderId: '1086182683711',
    projectId: 'sonorous-saga-449814-u7',
    storageBucket: 'sonorous-saga-449814-u7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7UF7BrhbR4nKh--iwwDEMiS94P_qpMSI',
    appId: '1:1086182683711:ios:21541972e3cb8ab900b48a',
    messagingSenderId: '1086182683711',
    projectId: 'sonorous-saga-449814-u7',
    storageBucket: 'sonorous-saga-449814-u7.firebasestorage.app',
    iosClientId: '1086182683711-j6m5dvibanav3ioie1les3mldl79sre2.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverpodtutorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7UF7BrhbR4nKh--iwwDEMiS94P_qpMSI',
    appId: '1:1086182683711:ios:21541972e3cb8ab900b48a',
    messagingSenderId: '1086182683711',
    projectId: 'sonorous-saga-449814-u7',
    storageBucket: 'sonorous-saga-449814-u7.firebasestorage.app',
    iosClientId: '1086182683711-j6m5dvibanav3ioie1les3mldl79sre2.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverpodtutorial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDyRuNTbNUBdKAndjV-lHGvJN4paHfuVso',
    appId: '1:1086182683711:web:bb66b557423e96d100b48a',
    messagingSenderId: '1086182683711',
    projectId: 'sonorous-saga-449814-u7',
    authDomain: 'sonorous-saga-449814-u7.firebaseapp.com',
    storageBucket: 'sonorous-saga-449814-u7.firebasestorage.app',
    measurementId: 'G-YXDK3PG176',
  );
}
