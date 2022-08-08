import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'house_model.dart';
import 'house_provider.dart';

class HousesPage extends StatefulHookConsumerWidget {
  const HousesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends ConsumerState<HousesPage> {
  @override
  Widget build(BuildContext context) {
    final houses = ref.watch(houseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Houses'),
      ),
      body: Center(
        child: Visibility(
          visible: houses.isNotEmpty,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount: houses.length,
            itemBuilder: (context, index) {
              HouseModel house = houses[index];
              return ListTile(
                title: Text(house.name),
                subtitle: Text(house.heads[0].firstName),
                trailing: CircleAvatar(
                  radius: 40,
                  child: Text(
                    house.animal ?? 'X',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
