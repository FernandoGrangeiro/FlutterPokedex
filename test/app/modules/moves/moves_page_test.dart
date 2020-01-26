import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/Evolution/Evolution_page.dart';

main() {
  testWidgets('EvolutionPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(EvolutionPage(title: 'Evolution')));
    final titleFinder = find.text('Evolution');
    expect(titleFinder, findsOneWidget);
  });
}
