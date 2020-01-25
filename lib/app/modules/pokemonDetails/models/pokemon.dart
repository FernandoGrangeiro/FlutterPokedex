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
  }
  int id;
  TypeInfo typeInfo;
  String name;
  String image;
  int order;
  Stats stats;
}
