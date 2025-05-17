import 'dart:ui';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Se os campos forem válidos, redireciona para a Home
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    const dourado = Color(0xFFD2AE6D);
    const preto = Color(0xFF000000);

    return Scaffold(
      body: Stack(
        children: [
          // Fundo da tela
          Positioned.fill(
            child: Image.asset('fundo_loja.png', fit: BoxFit.cover),
          ),

          // Camada escura por cima do fundo
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Conteúdo da tela de login
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo da empresa
                    Image.asset(
                      'zassi_uniformes_empresariais_catalogo_virtual_logo_1.png',
                      width: 250,
                    ),
                    const SizedBox(height: 40),

                    // Campo de ID do usuário
                    TextFormField(
                      controller: _idController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'ID do Usuário',
                        labelStyle: const TextStyle(color: dourado),
                        fillColor: preto,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: dourado),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: dourado, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite o ID do usuário';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Campo de senha
                    TextFormField(
                      controller: _senhaController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: const TextStyle(color: dourado),
                        fillColor: preto,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: dourado),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: dourado, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Digite a senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // Botão de login
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
          ),
        ],
      ),
    );
  }
}
