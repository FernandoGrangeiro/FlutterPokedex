import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:flutterpokedex/app/modules/whoisthat/whoisthat_page.dart';

main() {
  testWidgets('WhoisthatPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(WhoisthatPage(title: 'Whoisthat')));
    final titleFinder = find.text('Whoisthat');
    expect(titleFinder, findsOneWidget);
  });
}
