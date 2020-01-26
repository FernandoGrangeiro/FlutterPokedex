import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemon.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/typeInfo.dart';

class PokemonDetailsService {
  final dio = Dio();

  Future<Pokemon> getPokemonDetails(String id, bool shouldShowFetchOutsmarter) async {
    String url = shouldShowFetchOutsmarter ? 'https://1qywc1qhbh.execute-api.us-east-1.amazonaws.com/dev/getPerson?id=' : 'https://pokeapi.co/api/v2/pokemon/';
    Response response = await dio.get(url + id);
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
    Types type = getTypeFromString(decodedJson['types'][decodedJson['types'].length - 1]['type']['name']);
    Pokemon pokemon = Pokemon.fromJson(jsonDecode(jsonResponseString), new TypeInfo(type), stats);

    return pokemon;
  }
}

Types getTypeFromString(String typeName) {
  switch (typeName) {
    case 'normal': {
      return Types.normal;
    }
    break;
    case 'fighting': {
      return Types.fighting;
    }
    break;
    case 'flying': {
      return Types.flying;
    }
    break;
    case 'poison': {
      return Types.poison;
    }
    break;
    case 'ground': {
      return Types.ground;
    }
    break;
    case 'rock': {
      return Types.rock;
    }
    break;
    case 'bug': {
      return Types.bug;
    }
    break;
    case 'ghost': {
      return Types.ghost;
    }
    break;
    case 'steel': {
      return Types.steel;
    }
    break;
    case 'fire': {
      return Types.fire;
    }
    break;
    case 'water': {
      return Types.water;
    }
    break;
    case 'grass': {
      return Types.grass;
    }
    break;
    case 'electric': {
      return Types.electric;
    }
    break;
    case 'psychic': {
      return Types.psychic;
    }
    break;
    case 'ice': {
      return Types.ice;
    }
    break;
    case 'dragon': {
      return Types.dragon;
    }
    break;
    case 'dark': {
      return Types.dark;
    }
    break;
    case 'fairy': {
      return Types.fairy;
    }
    break;
    case 'unknown': {
      return Types.unknown;
    }
    break;
    case 'shadow': {
      return Types.shadow;
    }
    break;
    default: {
      return Types.unknown;
    }
  }
}
