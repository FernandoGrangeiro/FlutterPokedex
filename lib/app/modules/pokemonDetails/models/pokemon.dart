import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/typeInfo.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';

class Pokemon {
  Pokemon(int id, Types type, String name, String image, int order, Stats stats,
      String evolutionChain) {
    this.id = id;
    this.typeInfo = TypeInfo(type);
    this.name = name;
    this.image = image;
    this.order = order;
    this.stats = stats;
    this.stats = stats;
    this.evolutionChain = evolutionChain;
  }

  int id;
  TypeInfo typeInfo;
  String name;
  String image;
  int order;
  Stats stats;
  String evolutionChain;

  Pokemon.fromJson(
    Map<String, dynamic> json,
    TypeInfo type,
    Stats stats,
  )   : id = json['id'],
        typeInfo = type,
        stats = stats,
        image =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                json['id'].toString() +
                '.png',
        order = json['order'],
        evolutionChain = json['species']['url'],
        name = json['name'];
}
