import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemon.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/typeInfo.dart';

class PokemonDetailsService {
  final dio = Dio();

  Future<Pokemon> getPokemonDetails(String id) async {
    Response response = await dio.get('https://pokeapi.co/api/v2/pokemon/' + id);
    String jsonResponseString = response.toString();
    Map<String, dynamic> decodedJson = jsonDecode(jsonResponseString);
    int attack = 0;
    int defense = 0;
    int hp = 0;
    int specialAttack = 0;
    int specialDefense = 0;
    int speed = 0;
    for (int i = 0; i < decodedJson['stats'].length; i++) {
      Map<String, dynamic> statJson = decodedJson['stats'][i];
      int baseStat = statJson['base_stat'];
      Map<String, dynamic> statNameInfo = statJson['stat'];
      switch(statNameInfo['name']) {
        case 'speed': {
          speed = baseStat;
        }
        break;
        case 'special-defense': {
          specialDefense = baseStat;
        }
        break;
        case 'special-attack': {
          specialAttack = baseStat;
        }
        break;
        case 'defense': {
          defense = baseStat;
        }
        break;
        case 'attack': {
          attack = baseStat;
        }
        break;
        case 'hp': {
          hp = baseStat;
        }
        break;
        default:
      }
    }

    Stats stats = Stats(speed, attack, defense, specialAttack, specialDefense, hp);

    Pokemon pokemon = Pokemon.fromJson(jsonDecode(jsonResponseString), TypeInfo(Types.fire), stats);
    print('pokemon: ' + pokemon.toString());

//    Pokemon pokemon = Pokemon(4, Types.fire, 'Charmander', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 5, stats);

    return pokemon;
  }
}

//Types map(String typeName) {
//  switch (typeName) {
//    case ''
//  }
//}
