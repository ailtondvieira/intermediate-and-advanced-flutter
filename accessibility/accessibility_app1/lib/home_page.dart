import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              'https://images2.alphacoders.com/720/72092.jpg',
              semanticLabel: 'Imagem bonitinha e roxa.',
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {},
              tooltip: 'Botão salvar',
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {},
            ),
            Semantics(
              hint: 'Imagem bonitinha e roxa',
              child: InkWell(
                excludeFromSemantics: true,
                child: const Text('Não Salvar'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
