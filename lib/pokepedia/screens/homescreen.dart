import 'package:flutter/material.dart';
import 'pokemon_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A sample list of Pokémon with their names and image icons
    final List<Map<String, String>> pokemons = [
      {'name': 'Pikachu', 'icon': 'assets/images/pikachu.png'},
      {'name': 'Bulbasaur', 'icon': 'assets/images/bulbasaur.png'},
      {'name': 'Charmander', 'icon': 'assets/images/charmander.png'},
      {'name': 'Squirtle', 'icon': 'assets/images/squirtle.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
        backgroundColor: const Color(0xFF131145),
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return ListTile(
            leading: Image.asset(pokemon['icon']!, width: 50, height: 50),
            title: Text(pokemon['name']!, style: const TextStyle(fontSize: 20)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetailsScreen(pokemonName: pokemon['name']!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
