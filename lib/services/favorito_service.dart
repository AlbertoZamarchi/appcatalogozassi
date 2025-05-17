import 'package:shared_preferences/shared_preferences.dart';

class FavoritoService {
  static const _key = 'favoritos';

  Future<void> salvarFavorito(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritos = prefs.getStringList(_key) ?? [];
    if (!favoritos.contains(item)) {
      favoritos.add(item);
      await prefs.setStringList(_key, favoritos);
    }
  }

  Future<void> removerFavorito(String item) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritos = prefs.getStringList(_key) ?? [];
    favoritos.remove(item);
    await prefs.setStringList(_key, favoritos);
  }

  Future<List<String>> obterFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<bool> isFavorito(String item) async {
    final favoritos = await obterFavoritos();
    return favoritos.contains(item);
  }
}
