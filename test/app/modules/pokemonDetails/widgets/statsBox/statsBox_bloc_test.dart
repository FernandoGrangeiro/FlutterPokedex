import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statsBox/statsBox_bloc.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_module.dart';

void main() {
  initModule(PokemonDetailsModule());
  StatsBoxBloc bloc;

  setUp(() {
    bloc = PokemonDetailsModule.to.bloc<StatsBoxBloc>();
  });

  group('StatsBoxBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<StatsBoxBloc>());
    });
  });
}
