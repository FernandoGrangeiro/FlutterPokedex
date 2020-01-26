import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/whoisthatoutsmarter/whoisthatoutsmarter_page.dart';

main() {
  testWidgets('WhoisthatoutsmarterPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(
        WhoisthatoutsmarterPage(title: 'Whoisthatoutsmarter')));
    final titleFinder = find.text('Whoisthatoutsmarter');
    expect(titleFinder, findsOneWidget);
  });
}
