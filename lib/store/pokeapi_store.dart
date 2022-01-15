import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokeAPI.dart';
import 'package:pokedex/models/pokemon.dart';
part 'pokeapi_store.g.dart';

/*
  Feito esta estrutura é rodado por linha de comando na pasta do projeto o seguinte comando
  flutter packages pub run build_runner build
  este comando criará o arquivo 'g.dart' referente ao mobx
  se quiser depois pode ser rodado o comando:
  flutter packages pub run build_runner watch
  este comando ficará rodando no decorrer do desenvolvimento atualizando os codigos a cada alteração
  para evitar ter que ficar rodando o comando anterior sempre.
*/

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  late PokeAPI _pokeAPI = PokeAPI(pokemons: []);

  @observable
  late Pokemon _pokemonAtual;

  @observable
  late int posicaoAtual;

  @observable
  late Color corPokemon;

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @computed
  Pokemon get pokemonAtual => _pokemonAtual;

  //Faz o carregamento e passagem do rultado tratado para a variavel do tipo model
  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  //Retorna o resultado da class  pokemon já com seus devidos valores para a reutilização
  Pokemon getPokemon({required int index}) {
    return _pokeAPI.pokemons[index];
  }

  @action
  setPokemonAtual({required int index}) {
    _pokemonAtual = _pokeAPI.pokemons[index];
    if (_pokemonAtual.type.isNotEmpty) {
      corPokemon = ConstsAPI.getColorType(type: _pokemonAtual.type[0])!;
    }
    posicaoAtual = index;
  }

  @action
  //Obtem a imagem do pokemon
  Widget getImage({required String numero}) {
    return CachedNetworkImage(
      // package - guarda a imagem em cache e evita de estar o tempo todo indo buscar a imagem na rede
      // placeholder: ... -> o que vaiaparecer no lugar da imagem enquanto ela estiver sendo carregada.
      placeholder: (context, url) => Container(
        color: Colors.transparent,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  //Carrega os pokemons da api .json
  Future loadPokeAPI() async {
    var url = Uri.parse(ConstsAPI.pokeapiURL);
    final response = await http.get(url);
    var decodeJson = jsonDecode(response.body);
    return PokeAPI.fromJson(decodeJson);
  }
}
