import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_page.dart';

main() {
  testWidgets('PokemonListPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PokemonListPage(title: 'PokemonList')));
    final titleFinder = find.text('PokemonList');
    expect(titleFinder, findsOneWidget);
  });
}
