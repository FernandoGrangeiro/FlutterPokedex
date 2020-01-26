import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/typeInfo.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';

class Pokemon {
  Pokemon(int id, Types type, String name, String image, int order, Stats stats) {
    this.id = id;
    this.typeInfo = TypeInfo(type);
    this.name = name;
    this.image = image;
    this.order = order;
    this.stats = stats;
    this.shinyImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/$id.png";
  }
  int id;
  TypeInfo typeInfo;
  String name;
  String image;
  String shinyImage;
  int order;
  Stats stats;

  Pokemon.fromJson(Map<String, dynamic> json, TypeInfo type, Stats stats,)
      : id = json['id'], typeInfo = type, stats = stats, image = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/'+ json['id'].toString() +'.png', shinyImage = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/' + json['id'].toString() + '.png', order = json['order'], name = json['name'];
}
