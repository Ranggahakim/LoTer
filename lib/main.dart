import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loter/Pages/NoConnectionPage.dart';
import 'package:loter/Pages/authPage.dart';
import 'package:loter/firebase_options.dart';

void main() {
 runApp(const StartApp());
  // ···
}

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  Future<FirebaseApp> _initiazlizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return firebaseApp;
  }

  @override
  Widget build(BuildContextcontext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: FutureBuilder(
            future: _initiazlizeFirebase(),
            builder: (context, snapshot)
            {
              if(snapshot.connectionState == ConnectionState.done)
              {
                return const MyAuth();
              }else
              {
                return const MyNoConnection();
              }
            } 
            ),
      ),
    );
  }
}