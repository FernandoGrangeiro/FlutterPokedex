import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/Evolution/Evolution_bloc.dart';
import 'package:flutterpokedex/app/modules/Evolution/Evolution_module.dart';

void main() {
  initModule(EvolutionModule());
  EvolutionBloc bloc;

  setUp(() {
    bloc = EvolutionModule.to.bloc<EvolutionBloc>();
  });

  group('EvolutionBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<EvolutionBloc>());
    });
  });
}
