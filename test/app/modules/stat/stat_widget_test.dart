import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/stat/stat_widget.dart';

main() {
  testWidgets('StatWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(StatWidget()));
    final textFinder = find.text('Stat');
    expect(textFinder, findsOneWidget);
  });
}
