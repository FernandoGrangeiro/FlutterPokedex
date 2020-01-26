import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';
import 'package:flutter/material.dart';

class TypeInfo {
  TypeInfo(Types typeEnum) {
    switch (typeEnum) {
      case Types.normal: {
        this.name = 'normal';
        this.color = Color.fromRGBO(168, 167, 121, 1);
      }
      break;
      case Types.fighting: {
        this.name = 'fighting';
        this.color = Color.fromRGBO(165, 51, 44, 1);
      }
      break;
      case Types.flying: {
        this.name = 'flying';
        this.color = Color.fromRGBO(161, 142, 238, 1);
      }
      break;
      case Types.poison: {
        this.name = 'poison';
        this.color = Color.fromRGBO(139, 65, 157, 1);
      }
      break;
      case Types.ground: {
        this.name = 'ground';
        this.color = Color.fromRGBO(216, 191, 110, 1);
      }
      break;
      case Types.rock: {
        this.name = 'rock';
        this.color = Color.fromRGBO(176, 158, 66, 1);
      }
      break;
      case Types.bug: {
        this.name = 'bug';
        this.color = Color.fromRGBO(171, 182, 54, 1);
      }
      break;
      case Types.ghost: {
        this.name = 'ghost';
        this.color = Color.fromRGBO(106, 87, 150, 1);
      }
      break;
      case Types.steel: {
        this.name = 'steel';
        this.color = Color.fromRGBO(183, 182, 206, 1);
      }
      break;
      case Types.fire: {
        this.name = 'fire';
        this.color = Color.fromRGBO(216, 126, 55, 1);
      }
      break;
      case Types.water: {
        this.name = 'water';
        this.color = Color.fromRGBO(116, 143, 236, 1);
      }
      break;
      case Types.grass: {
        this.name = 'grass';
        this.color = Color.fromRGBO(147, 199, 90, 1);
      }
      break;
      case Types.electric: {
        this.name = 'electric';
        this.color = Color.fromRGBO(238, 208, 68, 1);
      }
      break;
      case Types.psychic: {
        this.name = 'psychic';
        this.color = Color.fromRGBO(218, 88, 133, 1);
      }
      break;
      case Types.ice: {
        this.name = 'ice';
        this.color = Color.fromRGBO(172, 216, 216, 1);
      }
      break;
      case Types.dragon: {
        this.name = 'dragon';
        this.color = Color.fromRGBO(98, 58, 244, 1);
      }
      break;
      case Types.dark: {
        this.name = 'dark';
        this.color = Color.fromRGBO(105, 87, 73, 1);
      }
      break;
      case Types.fairy: {
        this.name = 'fairy';
        this.color = Color.fromRGBO(230, 173, 253, 1);
      }
      break;
      case Types.unknown: {
        this.name = 'unknown';
        this.color = Color.fromRGBO(0, 0, 0, 1);
      }
      break;
      case Types.shadow: {
        this.name = 'shadow';
        this.color = Color.fromRGBO(106, 87, 150, 1);
      }
      break;
      default: {
        this.name = 'unknown';
        this.color = Color.fromRGBO(0, 0, 0, 1);
      }
    }
  }
  String name;
  Color color;

}
