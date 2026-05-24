import 'package:flutter/material.dart';

import '../features/home/home_page.dart';
import '../features/pokemons/detalhes_pokemon_page.dart';
import '../features/produtos/detalhes_produto_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String detalhesProduto = '/detalhes-produto';

  // TODO ALUNO: ao criar uma nova tela de detalhes, cadastre aqui

  static Future<Map<String, WidgetBuilder>> getRoutes() async {
    return {
      home: (context) => const HomePage(),
      detalhesProduto: (context) => const DetalhesProdutoPage(),

      // TODO ALUNO: depois de criar a página, conecte a rota ao widget da tela.
    };
  }
}
