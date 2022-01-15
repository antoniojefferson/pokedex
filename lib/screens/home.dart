import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/widgets/navBar.dart';
import 'package:pokedex/widgets/pokeList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PokeApiStore _pokemonStore;

  void loadData() {
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokemonStore.fetchPokemonList();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: deviceData.size.width,
        height: deviceData.size.height,
        padding: EdgeInsets.only(top: deviceData.padding.top),
        child: Stack(
          children: [
            Positioned(
              top: -60,
              left: deviceData.size.width - 139,
              child: Image.asset(
                'assets/images/pokeball.png',
                width: 200,
                color: Colors.grey[300],
              )
            ),
            Positioned(
              child: NavBar(title: 'Pokedex'),
            ),
            Positioned(
              top: 140,
              child: Observer(
                builder: (_) => _pokemonStore.pokeAPI.pokemons.isNotEmpty ? PokeList(
                  width: deviceData.size.width,
                  height: (deviceData.size.height - deviceData.padding.top) - 140,
                  pokemons: _pokemonStore.pokeAPI.pokemons,
                ) : Container()
              )
            ),
          ]
        ),
      ),
    );
  }
}
