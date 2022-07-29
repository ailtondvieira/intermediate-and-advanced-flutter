import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink),
        home: const HomePage(),
      ),
    ),
  );
}

final fruitProvider = StateProvider<String>((ref) => 'unknown');

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruit = ref.watch(fruitProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha fruta favorita é ${fruit.state}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FruitButton('Uva'),
            FruitButton('Morango'),
            FruitButton('Laranja'),
            FruitButton('Abacaxi'),
            FruitButton('Banana'),
          ],
        ),
      ),
    );
  }
}

class FruitButton extends HookConsumerWidget {
  final String fruit;
  const FruitButton(this.fruit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.watch(fruitProvider.notifier).state = fruit;
      },
      child: Text(fruit),
    );
  }
}
