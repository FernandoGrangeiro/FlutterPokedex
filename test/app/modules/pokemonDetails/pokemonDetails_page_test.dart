import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_page.dart';

main() {
  testWidgets('PokemonDetailsPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(PokemonDetailsPage(title: 'PokemonDetails')));
    final titleFinder = find.text('PokemonDetails');
    expect(titleFinder, findsOneWidget);
  });
}
