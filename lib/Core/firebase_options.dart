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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlkBwhGh5ebiz4KTh2dn2Awm1V0VI4N4o',
    appId: '1:23433506441:android:9f1da22fc39e33441de058',
    messagingSenderId: '23433506441',
    projectId: 'highway-gates-9b3c0',
    databaseURL: 'https://highway-gates-9b3c0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'highway-gates-9b3c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWig5RxvZj-8EwCTYxiXtDHIvkCMGTT4k',
    appId: '1:23433506441:ios:e95c6e404b45a2861de058',
    messagingSenderId: '23433506441',
    projectId: 'highway-gates-9b3c0',
    databaseURL: 'https://highway-gates-9b3c0-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'highway-gates-9b3c0.appspot.com',
    iosClientId: '23433506441-jn8krrtgeet4dfn1hcko1il2q915ee9q.apps.googleusercontent.com',
    iosBundleId: 'com.highwaygates.highwayGates',
  );
}
