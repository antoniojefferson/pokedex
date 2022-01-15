import 'package:flutter/material.dart';

class ConstsAPI {
  static String pokeapiURL =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Color? getColorType({String? type}) {
    Color? color;
    switch (type) {
      case 'Normal':
        color = Colors.brown[400];
        break;
      case 'Fire':
        color = Colors.red;
        break;
      case 'Water':
        color = Colors.blue;
        break;
      case 'Grass':
        color = Colors.green;
        break;
      case 'Electric':
        color = Colors.amber;
        break;
      case 'Ice':
        color = Colors.cyanAccent[400];
        break;
      case 'Fighting':
        color = Colors.orange;
        break;
      case 'Poison':
        color = Colors.purple;
        break;
      case 'Ground':
        color = Colors.orange[300];
        break;
      case 'Flying':
        color = Colors.indigo[200];
        break;
      case 'Psychic':
        color = Colors.pink;
        break;
      case 'Bug':
        color = Colors.lightGreen[500];
        break;
      case 'Rock':
        color = Colors.grey;
        break;
      case 'Ghost':
        color = Colors.indigo[400];
        break;
      case 'Dark':
        color = Colors.brown;
        break;
      case 'Dragon':
        color = Colors.indigo[800];
        break;
      case 'Steel':
        color = Colors.blueGrey;
        break;
      case 'Fairy':
        color = Colors.pinkAccent[100];
        break;
      default:
        color = Colors.grey;
        break;
    }

    return color;
  }
}
