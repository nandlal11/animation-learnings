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
    apiKey: 'AIzaSyBT3dXM5lGlFkuwAg7CMR_ll9lSFIXwy8s',
    appId: '1:537116962275:web:22f7623e9eee39c96004d6',
    messagingSenderId: '537116962275',
    projectId: 'animation-demo-49cad',
    authDomain: 'animation-demo-49cad.firebaseapp.com',
    storageBucket: 'animation-demo-49cad.firebasestorage.app',
    measurementId: 'G-F5MFSG7MVJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx3L460Yvq91ToxOuzEazxuAxehBX7wxo',
    appId: '1:537116962275:android:2d829b832093ac156004d6',
    messagingSenderId: '537116962275',
    projectId: 'animation-demo-49cad',
    storageBucket: 'animation-demo-49cad.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAY6ltBJjLMpxXKtgnxSOfdFZYe20DE7sM',
    appId: '1:537116962275:ios:b929b9afe620b4c96004d6',
    messagingSenderId: '537116962275',
    projectId: 'animation-demo-49cad',
    storageBucket: 'animation-demo-49cad.firebasestorage.app',
    iosBundleId: 'com.anim.animationDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAY6ltBJjLMpxXKtgnxSOfdFZYe20DE7sM',
    appId: '1:537116962275:ios:b929b9afe620b4c96004d6',
    messagingSenderId: '537116962275',
    projectId: 'animation-demo-49cad',
    storageBucket: 'animation-demo-49cad.firebasestorage.app',
    iosBundleId: 'com.anim.animationDemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBT3dXM5lGlFkuwAg7CMR_ll9lSFIXwy8s',
    appId: '1:537116962275:web:cb47f52cda07991c6004d6',
    messagingSenderId: '537116962275',
    projectId: 'animation-demo-49cad',
    authDomain: 'animation-demo-49cad.firebaseapp.com',
    storageBucket: 'animation-demo-49cad.firebasestorage.app',
    measurementId: 'G-SNF45YCQW9',
  );
}
