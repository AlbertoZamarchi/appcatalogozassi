import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ZassiApp());
}

class ZassiApp extends StatelessWidget {
  const ZassiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zassi Uniformes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir', // se você for usar a fonte do PDF depois
      ),
      home: const LoginScreen(),
    );
  }
}
