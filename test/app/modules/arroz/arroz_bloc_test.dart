import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/arroz/arroz_bloc.dart';
import 'package:flutterpokedex/app/modules/arroz/arroz_module.dart';

void main() {
  initModule(ArrozModule());
  ArrozBloc bloc;

  setUp(() {
    bloc = ArrozModule.to.bloc<ArrozBloc>();
  });

  group('ArrozBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ArrozBloc>());
    });
  });
}
