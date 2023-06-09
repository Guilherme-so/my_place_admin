import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oktoast/oktoast.dart';
import 'core/theme.dart';
import 'firebase_options.dart';
import 'pages/SignIn/sign_in.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'My place admin',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SignInPage(),
      ),
    );
  }
}
