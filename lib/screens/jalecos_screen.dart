import 'package:flutter/material.dart';

class JalecosScreen extends StatelessWidget {
  const JalecosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const dourado = Color(0xFFD2AE6D);
    const imagens = [
      'jaleco_feminina_imagem_1.png',
      'jaleco_feminina_imagem_2.png',
      'jaleco_feminina_imagem_3.png',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Catálogo de Jalecos'),
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
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
    );
  }
}
