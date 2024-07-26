import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA1vnqZidTrNlhTqMWgqatgRsTS8MW9-do",
            authDomain: "planremind.firebaseapp.com",
            projectId: "planremind",
            storageBucket: "planremind.appspot.com",
            messagingSenderId: "490606516846",
            appId: "1:490606516846:web:ecb52be1e55837e5b1a47f",
            measurementId: "G-YR2D415PD7"));
  } else {
    await Firebase.initializeApp();
  }
}
