import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_module.dart';

void main() {
  initModule(PokemonDetailsModule());
  PokemonDetailsBloc bloc;

  setUp(() {
    bloc = PokemonDetailsModule.to.bloc<PokemonDetailsBloc>();
  });

  group('PokemonDetailsBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<PokemonDetailsBloc>());
    });
  });
}
