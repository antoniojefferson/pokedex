import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/config/routes.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokeCard.dart';

class PokeList extends StatelessWidget {
  final List<Pokemon> pokemons;
  const PokeList({ Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: pokemons.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: GestureDetector(
              child: ScaleAnimation(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PokeCard(
                    pokemon: pokemons[index]
                  ),
                ),
              ),
              onTap: () => Navigator.pushNamed(context, Routes.POKEDETAILS, arguments: pokemons[index]),
            ),
          );
        }
      ),
    );
  }
}