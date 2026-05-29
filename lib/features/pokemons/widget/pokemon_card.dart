import 'package:flutter/material.dart';
import '../../shared/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        // DETALHES VERDES: Borda sutil para destacar o card, usando a cor verde suave da paleta
        side: BorderSide(color: Colors.green.shade200, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          // TODO ALUNO (Questão 9): Configurar o evento de navegação para a tela de detalhes
          Navigator.pushNamed(
                context,
                '/detalhes-pokemon', // Rota cadastrada na Questão 2
                arguments: pokemon,   // Passa o objeto do Pokémon selecionado
            );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Identificador do número do Pokémon
              Align(
                alignment: Alignment.topRight,
                child: Text(
                    '#${pokemon.numero.toString().padLeft(3, '0')}',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
              ),
              // Imagem do Pokémon
              Expanded(
                child: Image.network(
                  pokemon.urlImagem,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                  },
                ),
              ),
              const SizedBox(height: 8),
              // Nome do Pokémon
              Text(
                pokemon.nome,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              // Tipo do Pokémon em formato de tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  pokemon.tipo,
                  style: TextStyle(
                    color: Colors.green.shade800,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}