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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA-xhGqjXGnK9169RsSnn1DjjF4lt9oGGo',
    appId: '1:851900427720:web:ebb85d03a4b6c4c7a1e4fd',
    messagingSenderId: '851900427720',
    projectId: 'andrious-solutions-ltd-website',
    authDomain: 'andrious-solutions-ltd-website.firebaseapp.com',
    storageBucket: 'andrious-solutions-ltd-website.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJiEaQgTBVgxQyaOy7Z1xNVrg5LDe2AYY',
    appId: '1:851900427720:android:ff7734dd1cd10cfea1e4fd',
    messagingSenderId: '851900427720',
    projectId: 'andrious-solutions-ltd-website',
    storageBucket: 'andrious-solutions-ltd-website.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClwJSnQgtRx3ktvBtBINX9rhJbqVLRccc',
    appId: '1:851900427720:ios:42f5774694574f5ea1e4fd',
    messagingSenderId: '851900427720',
    projectId: 'andrious-solutions-ltd-website',
    storageBucket: 'andrious-solutions-ltd-website.appspot.com',
    iosClientId: '851900427720-qm4aamgt7asmg8hn0maf2iphtebep1fc.apps.googleusercontent.com',
    iosBundleId: 'com.example.andrious',
  );
}
