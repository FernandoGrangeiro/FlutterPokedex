import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutter/material.dart';

class TypeInfo {
  TypeInfo(Types typeEnum) {
    switch (typeEnum) {
      case Types.normal: {
        this.name = 'normal';
        this.color = Color(0xCCCFCA00);
      }
      break;
      default: {
        this.name = 'fire';
        this.color = Color.fromRGBO(255, 0, 0, 1);
      }
    }
  }
  String name;
  Color color;
}
