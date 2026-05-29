import 'package:flutter/material.dart';
import '../../shared/models/pokemon.dart';
import 'pokemon_card.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Carrega os dados simulados que criamos na model
    final listaPokemons = pokemonsFake;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: listaPokemons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Exibe os cards em duas colunas organizadas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85, // Ajuste de proporção vertical do card
          ),
          itemBuilder: (context, index) {
            final pokemon = listaPokemons[index];
            // Renderiza o componente isolado da subpasta widgets
            return PokemonCard(pokemon: pokemon);
          },
        ),
      ),
    );
  }
}