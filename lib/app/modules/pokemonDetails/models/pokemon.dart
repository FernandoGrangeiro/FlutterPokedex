import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/typeInfo.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';

class Pokemon {
  Pokemon(int id, Types type, String name, String image, int order, Stats stats,
      String evolutionChain,
      String shinyImage) {
    this.id = id;
    this.typeInfo = TypeInfo(type);
    this.name = name;
    this.image = image;
    this.order = order;
    this.stats = stats;
    this.stats = stats;
    this.evolutionChain = evolutionChain;
    this.shinyImage =
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/$id.png";
  }

  int id;
  TypeInfo typeInfo;
  String name;
  String image;
  int order;
  Stats stats;
  String evolutionChain, shinyImage;

  Pokemon.fromJson(Map<String, dynamic> json,
      TypeInfo type,
      Stats stats,
      bool isOutsmarter)
      : id = json['id'],
        typeInfo = type,
        stats = stats,
        image =
            !isOutsmarter ? 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                json['id'].toString() +
                '.png' : 'https://appsimples-bucket.s3.amazonaws.com/outsmart-images/' + json['id'].toString() + '.png',
        order = json['order'],
        evolutionChain = json['species']['url'],
        name = json['name'],
        shinyImage = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/' +
            json['id'].toString() + '.png';



}
