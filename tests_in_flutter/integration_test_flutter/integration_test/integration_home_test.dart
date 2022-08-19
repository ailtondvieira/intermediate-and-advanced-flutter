import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_flutter/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  sleepSec(int sec) => sleep(Duration(seconds: sec));

  testWidgets('Testando a home page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byTooltip('Increment'));
    await tester.pumpAndSettle();

    sleepSec(2);

    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);

    sleepSec(1);

    await tester.enterText(
      find.byKey(const Key('text_field_login')),
      'ailton@strawti.com',
    );

    await tester.pumpAndSettle();
    sleepSec(1);

    await tester.enterText(
      find.byKey(const Key('text_field_password')),
      'Teste1239102938',
    );

    await tester.pumpAndSettle();
   
    sleepSec(10);
  });
}
