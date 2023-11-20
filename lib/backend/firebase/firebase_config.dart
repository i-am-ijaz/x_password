import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCL5WjiIeBqSDe9qHVMQUyjh4hkU1Vinv4",
            authDomain: "x-password-616i08.firebaseapp.com",
            projectId: "x-password-616i08",
            storageBucket: "x-password-616i08.appspot.com",
            messagingSenderId: "815239986420",
            appId: "1:815239986420:web:d45cf1e9a8cbbc00c332a1"));
  } else {
    await Firebase.initializeApp();
  }
}
