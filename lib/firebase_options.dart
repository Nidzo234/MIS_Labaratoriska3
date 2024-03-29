// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }



  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1TWdWEJL1ldQgGgKu2qTY-aut-c9B60U',
    appId: '1:1069975284507:android:dea26954795ff67adf81be',
    messagingSenderId: '1069975284507',
    projectId: 'mislabs-28e6c',
    storageBucket: 'mislabs-28e6c.appspot.com',
  );




}