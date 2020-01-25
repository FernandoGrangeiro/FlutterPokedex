import 'package:flutterpokedex/app/modules/whoisthat/whoisthat_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class WhoisthatModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => WhoisthatBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => Container();

  static Inject get to => Inject<WhoisthatModule>.of();
}
