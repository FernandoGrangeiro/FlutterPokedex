import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/arroz/arroz_page.dart';

main() {
  testWidgets('ArrozPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ArrozPage(title: 'Arroz')));
    final titleFinder = find.text('Arroz');
    expect(titleFinder, findsOneWidget);
  });
}
