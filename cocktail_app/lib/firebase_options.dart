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
    apiKey: 'AIzaSyCxf6QOv_dt6MiVUl2yKcg3g5usJ75Fk20',
    appId: '1:857820406851:web:1fcc3113829e72fc0c60f6',
    messagingSenderId: '857820406851',
    projectId: 'cocktailapp-f69b6',
    authDomain: 'cocktailapp-f69b6.firebaseapp.com',
    storageBucket: 'cocktailapp-f69b6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjlEykPjAHvSvGrDoAMo8j9h32wBbSZ7c',
    appId: '1:857820406851:android:41af2e4948594cda0c60f6',
    messagingSenderId: '857820406851',
    projectId: 'cocktailapp-f69b6',
    storageBucket: 'cocktailapp-f69b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmCVrqMD6Uxw_xgbFyqc_GUV5D5KMKLio',
    appId: '1:857820406851:ios:7573eb5e197129550c60f6',
    messagingSenderId: '857820406851',
    projectId: 'cocktailapp-f69b6',
    storageBucket: 'cocktailapp-f69b6.appspot.com',
    iosClientId: '857820406851-shae7uo0haa6ogiuj68r4i3bc549tq2g.apps.googleusercontent.com',
    iosBundleId: 'com.example.cocktailApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmCVrqMD6Uxw_xgbFyqc_GUV5D5KMKLio',
    appId: '1:857820406851:ios:7573eb5e197129550c60f6',
    messagingSenderId: '857820406851',
    projectId: 'cocktailapp-f69b6',
    storageBucket: 'cocktailapp-f69b6.appspot.com',
    iosClientId: '857820406851-shae7uo0haa6ogiuj68r4i3bc549tq2g.apps.googleusercontent.com',
    iosBundleId: 'com.example.cocktailApp',
  );
}