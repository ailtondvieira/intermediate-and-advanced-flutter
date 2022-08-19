import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/home_page.dart';
import 'package:widget_test/second_page.dart';

void main() {
  testWidgets('Testando cliques e finds', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // await tester.tap(find.text('Salvar'));
    // await tester.tap(find.byType(ElevatedButton));
    // await tester.tap(find.byKey(const Key('button_duplicated')));
    // await tester.tap(find.byKey(const Key('button_delete_home')));

    tester.printToConsole('Clicando no botão que irá para outra tela');
    await tester.tap(find.byKey(const Key('button_next_page')));

    tester.printToConsole('Esperando o Flutter terminar de renderizar tudo');
    await tester.pumpAndSettle();

    tester.printToConsole('Verificando se chegou na segunda página');
    expect(find.byType(SecondPage), findsOneWidget);
  });
}
