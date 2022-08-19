import 'package:about_riverpod/presenter/tasks/tasks_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TasksPage extends HookConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameUser = ref.watch(nameUserProvider);
    final nameState = ref.watch(nameStateProvider.state).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Olá $nameState'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (nameState == 'Ailton') {
            ref.read(nameStateProvider.notifier).state = 'A';
          } else {
            ref.read(nameStateProvider.notifier).state = 'Ailton';
          }
        },
        child: const Icon(
          Icons.change_circle,
          size: 40,
        ),
      ),
    );
  }
}
