import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonDetails/widgets/statItem/statItem_widget.dart';

main() {
  testWidgets('StatItemWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(StatItemWidget()));
    final textFinder = find.text('StatItem');
    expect(textFinder, findsOneWidget);
  });
}
