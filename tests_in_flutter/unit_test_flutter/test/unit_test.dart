import 'package:flutter_test/flutter_test.dart';
import 'change_counter.dart';

void main() {
  late ChangeCounter changeCounter;

  setUp(() {
    changeCounter = ChangeCounter();
  });

  group('Testando a classe ChangeCounter', () {
    test('Testando o valor inicial', () {
      expect(changeCounter.counter, equals(0));
    });

    test('Testando o increment', () {
      changeCounter.increment();
      expect(changeCounter.counter, equals(1));
    }, skip: true);

    test('Testando o decrement', () {
      changeCounter.decrement();
      expect(changeCounter.counter, equals(-1));
    });
  });
}
