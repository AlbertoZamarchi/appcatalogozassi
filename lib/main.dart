import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/camisas_screen.dart';
import 'screens/jalecos_screen.dart';
import 'screens/polos_screen.dart'; // nova importação

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zassi Catálogo Virtual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/camisas': (context) => const CamisasScreen(),
        '/jalecos': (context) => const JalecosScreen(),
        '/polos': (context) => const PolosScreen(), // ✅ nova rota adicionada
      },
    );
  }
}
