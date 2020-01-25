import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statItem/statItem_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_module.dart';

void main() {
  initModule(PokemonDetailsModule());
  StatItemBloc bloc;

  setUp(() {
    bloc = PokemonDetailsModule.to.bloc<StatItemBloc>();
  });

  group('StatItemBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<StatItemBloc>());
    });
  });
}
