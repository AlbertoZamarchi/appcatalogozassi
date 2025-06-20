import 'package:flutter/material.dart';

// 1️⃣ Faz a importação do pacote necessário para abrir links externos como o Google Maps
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 2️⃣ cria a função que monta a URL do Google Maps
  //com o endereço da loja e abre no navegador
  void abrirLocalizacaoLoja() async {
    final endereco = Uri.encodeComponent(
      'R. Tocantins, 1145 - São Vicente, Pato Branco - PR, 85501-090',
    );
    final url = 'https://www.google.com/maps/search/?api=1&query=$endereco';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o Google Maps.';
    }
  }

  @override
  Widget build(BuildContext context) {
    const dourado = Color(0xFFD2AE6D);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('fundo_preto_formas.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
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
                  const SizedBox(height: 32),

                  // 3️⃣ cria o botão que, ao ser clicado, chama a função para abrir a localização
                  // da loja no Google Maps
                  ElevatedButton.icon(
                    onPressed: abrirLocalizacaoLoja,
                    icon: const Icon(Icons.location_on),
                    label: const Text('Ver Loja no Mapa'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: dourado,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
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
