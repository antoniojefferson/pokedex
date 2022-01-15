import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/store/pokeapi_store.dart';
import 'package:pokedex/widgets/navBar.dart';
import 'package:pokedex/widgets/pokeList.dart';
enum OrderOptions {orderAZ, orderZA, orderID}

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
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: (-80 + deviceData.padding.top),
            left: deviceData.size.width - 139,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 200,
              color: Colors.grey[300],
            )
          ),
          Container(child: Column(children: [
            NavBar(
              title: 'Pokedex',
              menuWidget: PopupMenuButton<OrderOptions>(
                icon: const Icon(Icons.menu),
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                  const PopupMenuItem<OrderOptions>(
                    child: Text("Ordenar por ID"),
                    value: OrderOptions.orderID,
                  ),
                  const PopupMenuItem<OrderOptions>(
                    child: Text("Ordenar de A-Z"),
                    value: OrderOptions.orderAZ,
                  ),
                  const PopupMenuItem<OrderOptions>(
                    child: Text("Ordenar de Z-A"),
                    value: OrderOptions.orderZA,
                  ),
                ],
                // onSelected: () {},
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => _pokemonStore.pokeAPI.pokemons.isNotEmpty ? PokeList(
                  pokemons: _pokemonStore.pokeAPI.pokemons,
                ) : Container()
              ),
            )
          ],))
        ]
      ),
    );
  }
}
