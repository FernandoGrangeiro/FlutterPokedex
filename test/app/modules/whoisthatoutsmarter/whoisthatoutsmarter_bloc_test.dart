import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/whoisthatoutsmarter/whoisthatoutsmarter_bloc.dart';
import 'package:flutterpokedex/app/modules/whoisthatoutsmarter/whoisthatoutsmarter_module.dart';

void main() {
  initModule(WhoisthatoutsmarterModule());
  WhoisthatoutsmarterBloc bloc;

  setUp(() {
    bloc = WhoisthatoutsmarterModule.to.bloc<WhoisthatoutsmarterBloc>();
  });

  group('WhoisthatoutsmarterBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<WhoisthatoutsmarterBloc>());
    });
  });
}
