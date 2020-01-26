import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PokemonListModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PokemonListBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PokemonListModule>.of();
}
