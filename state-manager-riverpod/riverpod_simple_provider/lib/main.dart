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

final nameProvider = Provider<String>((ref) => 'Ailton D. Vieira');

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              userName,
              style: const TextStyle(fontSize: 30),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  HomePage.route,
                  arguments: 'Qualquer dado aqui (dynamic)'
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
