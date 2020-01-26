import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_module.dart';

void main() {
  initModule(PokemonListModule());
  PokemonListBloc bloc;

  setUp(() {
    bloc = PokemonListModule.to.bloc<PokemonListBloc>();
  });

  group('PokemonListBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PokemonListBloc>());
    });
  });
}
