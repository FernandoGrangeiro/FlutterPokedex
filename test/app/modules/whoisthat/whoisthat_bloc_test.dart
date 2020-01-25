import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/whoisthat/whoisthat_bloc.dart';
import 'package:flutterpokedex/app/modules/whoisthat/whoisthat_module.dart';

void main() {
  initModule(WhoisthatModule());
  WhoisthatBloc bloc;

  setUp(() {
    bloc = WhoisthatModule.to.bloc<WhoisthatBloc>();
  });

  group('WhoisthatBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<WhoisthatBloc>());
    });
  });
}
