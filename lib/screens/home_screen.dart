import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const dourado = Color(0xFFD2AE6D);

    return Scaffold(
      body: Stack(
        children: [
          // Fundo da tela
          Positioned.fill(
            child: Image.asset('fundo_preto_formas.png', fit: BoxFit.cover),
          ),

          // Camada escura por cima do fundo
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Conteúdo principal com os botões
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _catalogButton(
                    context: context,
                    imagePath: 'camisa_feminina.png',
                    label: 'Camisas',
                    route: '/camisas',
                  ),
                  _catalogButton(
                    context: context,
                    imagePath: 'jaleco_feminina.png',
                    label: 'Jalecos',
                    route: '/jalecos',
                  ),
                  _catalogButton(
                    context: context,
                    imagePath: 'polo_feminina.png',
                    label: 'Polos',
                    route: '/polos',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _catalogButton({
    required BuildContext context,
    required String imagePath,
    required String label,
    required String route,
  }) {
    const dourado = Color(0xFFD2AE6D);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: dourado, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 220,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: const TextStyle(
                color: dourado,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
