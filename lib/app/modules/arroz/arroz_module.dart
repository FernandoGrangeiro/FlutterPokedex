import 'package:flutterpokedex/app/modules/arroz/arroz_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ArrozModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ArrozBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<ArrozModule>.of();
}
