import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final String pokemonName;

  const PokemonDetailsScreen({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    // Example data for different Pokémon
    final Map<String, String> pokemonDetails = {
      'Pikachu': 'Electric type, known for its speed and electric abilities.',
      'Bulbasaur': 'Grass/Poison type, known for its vine whip and evolution into Ivysaur.',
      'Charmander': 'Fire type, a lizard-like Pokémon with a flame on its tail.',
      'Squirtle': 'Water type, known for its powerful water gun and shell.',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('$pokemonName Details'),
        backgroundColor: const Color(0xFF131145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // You can replace with actual Pokemon images or URLs
            Image.asset(
              'assets/images/$pokemonName.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              pokemonDetails[pokemonName] ?? 'No details available.',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
