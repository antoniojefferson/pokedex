import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokeCard.dart';

class PokeList extends StatelessWidget {
  final double? width;
  final double? height;
  final List<Pokemon> pokemons;
  const PokeList({ Key? key, this.height, required this.pokemons, this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // color: Colors.blue,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PokeCard(
              pokemon: pokemons[index]
            ),
          );
        }
      ),
    );
  }
}