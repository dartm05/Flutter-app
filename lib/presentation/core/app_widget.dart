import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // Future<void> initializeDefault() async {
  //   FirebaseApp app = await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: 'AIzaSyC68NmpG0_tHY_HuX9FIX25374iWqKs7HY',
  //       appId: '1:315622192186:ios:f929b3e607f4c1769d7103',
  //       messagingSenderId: '315622192186',
  //       projectId: 'dddtutorial-f982d',
  //     ),
  //   );
  //   print('Initialized default app $app');
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        return MaterialApp(
          title: 'La mejor app',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF673AB7)),
            useMaterial3: true,
          ),
          home: const SignInPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
