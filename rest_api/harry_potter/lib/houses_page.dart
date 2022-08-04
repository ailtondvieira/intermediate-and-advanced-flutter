import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'house_model.dart';
import 'houses_repository.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  final HousesRepository _repository = HousesRepository(Dio());
  late Future<List<HouseModel>> houses;

  @override
  void initState() {
    houses = _repository.getAllHouses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: FutureBuilder(
          future: houses,
          builder: (context, AsyncSnapshot<List<HouseModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  HouseModel house = snapshot.data![index];
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
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
