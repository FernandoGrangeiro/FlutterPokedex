import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statsBox/statsBox_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statItem/statItem_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PokemonDetailsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => StatsBoxBloc()),
        Bloc((i) => StatItemBloc()),
        Bloc((i) => PokemonDetailsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PokemonDetailsModule>.of();
}
