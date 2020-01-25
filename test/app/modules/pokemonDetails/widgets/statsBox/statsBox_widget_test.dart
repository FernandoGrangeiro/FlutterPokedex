import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statsBox/statsBox_widget.dart';

main() {
  testWidgets('StatsBoxWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(StatsBoxWidget()));
    final textFinder = find.text('StatsBox');
    expect(textFinder, findsOneWidget);
  });
}
