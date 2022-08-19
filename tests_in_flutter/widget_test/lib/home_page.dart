import 'package:flutter/material.dart';
import 'package:widget_test/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                debugPrint('Salvando...');
              },
              child: const Text('Salvar'),
            ),
            IconButton(
              key: const Key('button_next_page'),
              icon: const Icon(Icons.navigate_next_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
            ElevatedButton(
              key: const Key('button_duplicated'),
              onPressed: () {
                debugPrint('Botão duplicado...');
              },
              child: const Text('Duplicado'),
            ),
            InkWell(
              onTap: () {
                debugPrint('Consultando...');
              },
              child: const Text('Consultar'),
            ),
            MaterialButton(
              onPressed: () {
                debugPrint('Atualizando...');
              },
              child: const Text('Atualizar'),
            ),
            TextButton(
              key: const Key('button_delete_home'),
              onPressed: () {
                debugPrint('Excluindo...');
              },
              child: const Text('Excluir'),
            ),
          ],
        ),
      ),
    );
  }
}
