import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonList/pages/pages_page.dart';

main() {
  testWidgets('PagesPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PagesPage(title: 'Pages')));
    final titleFinder = find.text('Pages');
    expect(titleFinder, findsOneWidget);
  });
}
