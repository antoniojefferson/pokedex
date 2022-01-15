import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex/config/routes.dart';
import 'package:pokedex/screens/home.dart';
import 'package:pokedex/store/pokeapi_store.dart';

main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeApiStore>(PokeApiStore());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));

  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      routes: {
        Routes.HOME: (ctx) => const Home(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
