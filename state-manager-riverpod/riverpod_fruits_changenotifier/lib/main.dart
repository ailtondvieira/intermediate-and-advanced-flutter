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

final favoritesProvider = ChangeNotifierProvider((ref) => Favorites());

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha fruta favorita é ${favorite.fruit}'),
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
        ref.watch(favoritesProvider).changeFruit(fruit);
      },
      child: Text(fruit),
    );
  }
}

class Favorites extends ChangeNotifier {
  String fruit = 'unknown';

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
