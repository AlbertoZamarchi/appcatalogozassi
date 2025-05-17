import 'package:flutter/material.dart';
import '../services/favorito_service.dart';

class CamisasScreen extends StatelessWidget {
  const CamisasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const dourado = Color(0xFFD2AE6D);
    const imagens = [
      'camisa_feminina_imagem_1.png',
      'camisa_feminina_imagem_2.png',
      'camisa_feminina_imagem_3.png',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Catálogo de Camisas'),
        backgroundColor: dourado,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children:
              imagens
                  .map(
                    (path) =>
                        _ZoomImageCard(imagePath: path, borderColor: dourado),
                  )
                  .toList(),
        ),
      ),
    );
  }
}

class _ZoomImageCard extends StatefulWidget {
  final String imagePath;
  final Color borderColor;

  const _ZoomImageCard({required this.imagePath, required this.borderColor});

  @override
  State<_ZoomImageCard> createState() => _ZoomImageCardState();
}

class _ZoomImageCardState extends State<_ZoomImageCard> {
  bool _hovering = false;
  bool _isFavorito = false;
  final _favoritoService = FavoritoService();

  @override
  void initState() {
    super.initState();
    _carregarFavorito();
  }

  void _carregarFavorito() async {
    final favorito = await _favoritoService.isFavorito(widget.imagePath);
    setState(() {
      _isFavorito = favorito;
    });
  }

  void _alternarFavorito() async {
    if (_isFavorito) {
      await _favoritoService.removerFavorito(widget.imagePath);
    } else {
      await _favoritoService.salvarFavorito(widget.imagePath);
    }
    _carregarFavorito();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Stack(
        children: [
          AnimatedScale(
            scale: _hovering ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 220,
              height: 330,
              decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor, width: 2),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: _alternarFavorito,
              child: Icon(
                _isFavorito ? Icons.favorite : Icons.favorite_border,
                color: widget.borderColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
