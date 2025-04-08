import 'dart:ui';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _login() {
    final id = _idController.text;
    final senha = _senhaController.text;
    print('Tentando login com ID: $id e Senha: $senha');
  }

  @override
  Widget build(BuildContext context) {
    const dourado = Color(0xFFD2AE6D);
    const preto = Color(0xFF000000);

    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          SizedBox.expand(
            child: Image.asset('fundo_loja.png', fit: BoxFit.cover),
          ),

          // Efeito de desfoque (blur)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.black.withOpacity(0.4), // leve escurecida
            ),
          ),

          // Conteúdo da tela
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Zassi Uniformes',
                    style: TextStyle(
                      color: dourado,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _idController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'ID do Usuário',
                      labelStyle: const TextStyle(color: dourado),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: dourado),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: dourado, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _senhaController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: const TextStyle(color: dourado),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: dourado),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: dourado, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dourado,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: preto,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
