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
    apiKey: 'AIzaSyCse6EPDzOEPs-bDTyCy-J_mqj5WtblYg8',
    appId: '1:21067989563:web:e82b312c13281b660c121e',
    messagingSenderId: '21067989563',
    projectId: 'khu-gdg-sc2-66a5a',
    authDomain: 'khu-gdg-sc2-66a5a.firebaseapp.com',
    storageBucket: 'khu-gdg-sc2-66a5a.firebasestorage.app',
    measurementId: 'G-VT7EEF048Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnbhQ5yI17iqE9HBOBRCMq3kWRvakKDBE',
    appId: '1:21067989563:android:b5e8336660936ec60c121e',
    messagingSenderId: '21067989563',
    projectId: 'khu-gdg-sc2-66a5a',
    storageBucket: 'khu-gdg-sc2-66a5a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6gp2X2yiaZBfIxTEIt6TGyffC9szu2tw',
    appId: '1:21067989563:ios:c212b1debb6617a70c121e',
    messagingSenderId: '21067989563',
    projectId: 'khu-gdg-sc2-66a5a',
    storageBucket: 'khu-gdg-sc2-66a5a.firebasestorage.app',
    iosBundleId: 'jeongwon.dev.gdgSprint',
  );
}
