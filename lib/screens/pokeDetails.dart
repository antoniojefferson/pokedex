import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/widgets/navBar.dart';

class PokeDetails extends StatefulWidget {
  const PokeDetails({ Key? key }) : super(key: key);

  @override
  State<PokeDetails> createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  PokeApiStore pokemonStore = GetIt.instance<PokeApiStore>();
  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    var deviceData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: ConstsAPI.getColorType(type: pokemon.type[0]),
      body: Column(children: [
        NavBar(
          title: pokemon.name,
          backPage: true,
          textColor: Colors.white,
          menuWidget: IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white,), onPressed: () {},),
        ),
        Expanded(child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(child: Container(
              height: (deviceData.size.height / 1.6) - 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft:  Radius.circular(30), topRight:  Radius.circular(30))
              ),
            )),
            Positioned(
              top: (deviceData.size.height / 4.5) - 70,
              child: Hero(
              tag: pokemon.name,
              child: Container(height: 200, child: pokemonStore.getImage(numero: pokemon.num))
            )),
        ],))
      ],)
    );
  }
}