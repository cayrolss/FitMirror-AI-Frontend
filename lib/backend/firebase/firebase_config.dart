import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQJtzOLqpfdR29mWUo5GC67cSD16lD6hw",
            authDomain: "fit-mirror-a-i-nwusib.firebaseapp.com",
            projectId: "fit-mirror-a-i-nwusib",
            storageBucket: "fit-mirror-a-i-nwusib.firebasestorage.app",
            messagingSenderId: "789265813244",
            appId: "1:789265813244:web:78a5434a3ddf3c5080d179"));
  } else {
    await Firebase.initializeApp();
  }
}
