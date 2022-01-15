import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/widgets/pokeChip.dart';

class PokeCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokeCard({ Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  PokeApiStore pokemonStore = GetIt.instance<PokeApiStore>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstsAPI.getColorType(type: widget.pokemon.type[0]),
        borderRadius: const BorderRadius.all(Radius.circular(21))
      ),
      // padding: const EdgeInsets.only(top: 17, right: 10, bottom: 10, left: 10),
      child: Stack(
        children: [
          Positioned(
            bottom: -6.9,
            right: -6.9,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 90,
              color: Colors.grey[300]!.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              width: 80,
              child: pokemonStore.getImage(numero: widget.pokemon.num)),
          ),
          Positioned(
            top: 20,
            left: 15,
            child: Text(widget.pokemon.name, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              )
            )
          ),
          Positioned(
            top: 45,
            left: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.pokemon.type.map((current) => PokeChip(text: current, paddingVertical: 3.5)).toList()
            )
          )
        ]
      ),
    );
  }
}