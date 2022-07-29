import 'package:flutter/material.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_emotions,
              size: 100,
              color: Colors.pink,
            ),
            const SizedBox(height: 25),
            Text(
              'Página não encontrada :(',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 50),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Voltar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
