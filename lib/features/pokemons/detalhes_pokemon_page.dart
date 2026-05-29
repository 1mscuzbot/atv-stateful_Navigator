import 'package:flutter/material.dart';
import '../../shared/models/pokemon.dart';

class DetalhesPokemonPage extends StatefulWidget {
  const DetalhesPokemonPage({Key? key}) : super(key: key);

  @override
  State<DetalhesPokemonPage> createState() => _DetalhesPokemonPageState();
}

class _DetalhesPokemonPageState extends State<DetalhesPokemonPage> {
  @override
  Widget build(BuildContext context) {
    // Extrai o objeto Pokemon enviado 
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nome),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 1. Imagem principal limpa ocupando o topo
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.green.shade50,
            padding: const EdgeInsets.all(20),
            child: Image.network(
              pokemon.urlImagem,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.none, // Otimização para imagens simples, mantendo a estética pixelada
            ),
          ),
          
          // 2. Bloco de Conteúdo Textual - 100% Alinhado à Esquerda 
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  // Nome e Número
                  Text(
                    '${pokemon.nome} #${pokemon.numero.toString().padLeft(3, '0')}',
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  
                  // Tipo
                  Text(
                    'Tipo: ${pokemon.tipo}',
                    style: TextStyle(fontSize: 18, color: Colors.green.shade700, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),

                  // Demais Atributos da Ficha
                  Row(
                    children: [
                      const Icon(Icons.star, size: 20, color: Colors.amber),
                      const SizedBox(width: 8),
                      Text('Nível de Experiência: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('Nível ${pokemon.nivel}', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.favorite, size: 20, color: Colors.red),
                      const SizedBox(width: 8),
                      Text('Pontos de Vida (HP): ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('${pokemon.hpAtual} / ${pokemon.hpMaximo}', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.catching_pokemon, size: 20, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text('Status: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        pokemon.capturado ? 'Capturado' : 'Selvagem',
                        style: TextStyle(fontSize: 16, color: pokemon.capturado ? Colors.green : Colors.orange, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Seção de Descrição
                  const Text(
                    'Descrição',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pokemon.descricao,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade800, height: 1.4),
                  ),
                ],
              ),
            ),
          ),

          // 3. Botão de Ação Inferior Estilo "Adicionar ao Carrinho" (Desafio 1) 
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pokemon.favorito ? Colors.red.shade700 : Colors.green.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: Icon(pokemon.favorito ? Icons.favorite : Icons.favorite_border),
                  // Gerenciamento de estado local simples via StatefulWidget 
                  onPressed: () {
                    setState(() {
                      pokemon.favorito = !pokemon.favorito;
                    });
                  },
                  label: Text(
                    pokemon.favorito ? 'Remover dos Favoritos' : 'Favoritar Pokémon',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}