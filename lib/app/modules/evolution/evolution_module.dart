import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'evolution_bloc.dart';

class EvolutionModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => EvolutionBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<EvolutionModule>.of();
}
