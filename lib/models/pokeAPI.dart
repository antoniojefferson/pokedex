import 'pokemon.dart';

class PokeAPI {
  List<Pokemon> pokemons = <Pokemon>[];

  PokeAPI({required this.pokemons});

  PokeAPI.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      json['pokemon'].forEach((v) {
        pokemons.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pokemon'] = pokemons.map((v) => v.toJson()).toList();
    return data;
  }
}
